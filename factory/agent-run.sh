#!/usr/bin/env bash
#
# Vínculo factory runner — one pass per invocation.
#
# A launchd job calls this every 15 minutes. It picks the oldest open issue
# labelled `ready-for-agent`, hands it to Claude Code headless in a throwaway
# git worktree, runs this project's checks, opens a pull request for Qodo to
# review, and on later passes feeds Qodo's findings back to the agent.
#
# Design rules, in order of how much they matter:
#
#   1. The runner owns the state machine; the agent owns the code. Retry and
#      round limits are enforced here, in bash, not by asking the model to
#      behave. That is what makes "set a retry limit" an auditable claim.
#   2. Work state lives on GitHub — labels on the ticket, comments on the PR —
#      never in the agent's memory of earlier passes. Each invocation starts
#      cold and reconstructs where it is from the repository.
#   3. The agent never pushes. It commits; this script pushes, to one branch
#      it names itself. `git push` is not on the agent's allow-list, so a
#      prompt injection in a Qodo comment or an issue body cannot reach `main`.
#   4. It never merges and never closes anything. The human merges.
#
# Status lines on stdout are the contract with launchd and with a human
# reading the log: IDLE, SKIP, PR_OPENED, WAITING_QODO, ROUND, READY, BLOCKED.
#
# Usage:
#   factory/agent-run.sh            one pass
#   factory/agent-run.sh --dry-run  preflight and ticket pick only; changes nothing
#
set -uo pipefail

# ---------------------------------------------------------------------------
# Configuration. Every value can be overridden from the environment, so the
# launchd plist can change a limit without editing this file.
# ---------------------------------------------------------------------------

# launchd gives a process almost no PATH. Everything this script shells out to
# has to be reachable from here, or the run dies with "command not found" and
# the failure looks like the agent's.
export PATH="${FACTORY_PATH_PREFIX:-$HOME/.local/bin:/opt/homebrew/bin:$HOME/.nvm/versions/node/v24.11.1/bin:$HOME/.pub-cache/bin}:/usr/bin:/bin:/usr/sbin:/sbin"

REPO_SLUG="${FACTORY_REPO:-panicoli0/vinculo}"
REPO_DIR="${FACTORY_REPO_DIR:-$HOME/development/vinculo}"
WORK_ROOT="${FACTORY_WORK_ROOT:-$HOME/development/vinculo-factory}"

# Limits. The hackathon brief asks for a retry limit and for the run to stop
# for help rather than grind; these are those numbers.
MAX_FIX_ROUNDS="${FACTORY_MAX_FIX_ROUNDS:-2}"        # rounds in which the agent changes code for Qodo
MAX_REVIEW_ROUNDS="${FACTORY_MAX_REVIEW_ROUNDS:-3}"  # total rounds of review answered
MAX_CHECK_ATTEMPTS="${FACTORY_MAX_CHECK_ATTEMPTS:-2}" # attempts to get the checks green while implementing
QODO_WAIT_MINUTES="${FACTORY_QODO_WAIT_MINUTES:-45}" # silence from the reviewer after which we stop
AGENT_TIMEOUT_SECONDS="${FACTORY_AGENT_TIMEOUT:-2700}"

LABEL_READY="ready-for-agent"
LABEL_WORKING="agent-working"
LABEL_DONE="agent-ready"
LABEL_BLOCKED="agent-blocked"

BRANCH_PREFIX="agent/issue-"
FACTORY_DIR="$REPO_DIR/factory"
RUN_LOG_DIR="$FACTORY_DIR/runs"
LOCK_DIR="$WORK_ROOT/.lock"

DRY_RUN=0
[ "${1:-}" = "--dry-run" ] && DRY_RUN=1

# ---------------------------------------------------------------------------
# Tool permissions for the headless agent.
#
# The agent runs with `--permission-prompts none`, so anything it is not
# allowed is refused outright rather than queued for a human who is not
# watching. Verified, not assumed: a denied Bash call comes back denied and the
# pass carries on.
#
# **The deny list is the real boundary, not the allow list.** `--allowedTools`
# is additive to whatever the host's own settings already permit, and this
# machine's `~/.claude/settings.json` carries a long personal allow-list that a
# headless run inherits. Deny rules win over allow rules wherever they overlap,
# so everything that must never happen is named below rather than merely left
# out above.
#
# That includes the interpreters. An agent that can run `python`, `perl`,
# `node` or a nested shell can do anything those can do, and the allow-list
# above stops meaning what it says. This is the exact finding Qodo raised
# against the reference implementation of this pattern, whose first tool list
# permitted any `git` or `python` command.
#
# Compound commands are avoided on purpose: `cd functions && npm run build`
# would match as one opaque string, so the playbooks use `npm --prefix
# functions`. Every prefix pattern ends in `:*` — a wildcard anywhere earlier
# would also match options inserted at that position.
# ---------------------------------------------------------------------------
ALLOWED_TOOLS="Read Glob Grep Edit Write TodoWrite \
Bash(fvm flutter analyze) \
Bash(fvm flutter pub get) \
Bash(fvm dart run slang) \
Bash(fvm dart run build_runner build) \
Bash(fvm dart format:*) \
Bash(git status:*) Bash(git diff:*) Bash(git log:*) Bash(git show:*) \
Bash(git add:*) Bash(git commit:*) \
Bash(npm ci:*) Bash(npm --prefix functions:*) \
Bash(gh issue view:*) Bash(gh pr view:*) Bash(gh pr diff:*) \
Bash(gh pr comment:*) Bash(gh api repos/$REPO_SLUG:*)"

DENIED_TOOLS="Bash(git push:*) Bash(git merge:*) Bash(git rebase:*) Bash(git reset:*) \
Bash(git checkout:*) Bash(git switch:*) Bash(git branch:*) Bash(git worktree:*) \
Bash(git remote:*) Bash(git clean:*) Bash(git config:*) \
Bash(gh pr merge:*) Bash(gh pr close:*) Bash(gh pr create:*) Bash(gh pr edit:*) \
Bash(gh issue close:*) Bash(gh issue edit:*) Bash(gh repo:*) Bash(gh workflow:*) \
Bash(gh secret:*) Bash(gh auth:*) \
Bash(firebase:*) Bash(gcloud:*) Bash(flutterfire:*) Bash(gsutil:*) Bash(aws:*) \
Bash(rm:*) Bash(mv:*) Bash(cp:*) Bash(chmod:*) Bash(chown:*) Bash(ln:*) \
Bash(sudo:*) Bash(su:*) Bash(curl:*) Bash(wget:*) Bash(ssh:*) Bash(scp:*) Bash(nc:*) \
Bash(launchctl:*) Bash(crontab:*) Bash(defaults:*) Bash(security:*) Bash(open:*) \
Bash(osascript:*) Bash(env:*) Bash(xargs:*) Bash(eval:*) Bash(exec:*) \
Bash(python:*) Bash(python3:*) Bash(perl:*) Bash(ruby:*) Bash(node:*) Bash(npx:*) \
Bash(sh:*) Bash(bash:*) Bash(zsh:*) Bash(dart:*) Bash(flutter:*) \
WebFetch WebSearch \
Edit(assets/content/decks/**) Write(assets/content/decks/**) \
Edit(factory/**) Write(factory/**) \
Edit(docs/**) Write(docs/**) Edit(.qodo/**) Write(.qodo/**) \
Edit(.github/**) Write(.github/**) Edit(.gitignore) Write(.gitignore)"

# ---------------------------------------------------------------------------
# Logging. Two destinations: a run log on disk for the human, and a timeline
# file whose lines are posted to the PR at the end of the run. `firebase-debug.log`
# taught this project that output not captured at the moment it happens is gone,
# so the timeline is written as events occur, never reconstructed afterwards.
# ---------------------------------------------------------------------------
mkdir -p "$RUN_LOG_DIR" "$WORK_ROOT"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
RUN_LOG="$RUN_LOG_DIR/$RUN_ID.log"
TIMELINE=""   # set once a ticket is picked

now_utc() { date -u +%Y-%m-%dT%H:%M:%SZ; }

log() { printf '%s  %s\n' "$(now_utc)" "$*" | tee -a "$RUN_LOG"; }

# A status line is the machine-readable half of the log: one per pass, last line.
status() { printf '%s\n' "$*" | tee -a "$RUN_LOG"; }

# An event goes to the log and to the timeline that gets posted publicly.
event() {
  log "$*"
  [ -n "$TIMELINE" ] && printf '%s  %s\n' "$(now_utc)" "$*" >>"$TIMELINE"
  return 0
}

cleanup() { [ -d "$LOCK_DIR" ] && rmdir "$LOCK_DIR" 2>/dev/null; }

# ---------------------------------------------------------------------------
# Preflight
# ---------------------------------------------------------------------------

preflight() {
  # One pass at a time. mkdir is atomic, so this is a real mutex and not a
  # check-then-act race between two launchd firings.
  if ! mkdir "$LOCK_DIR" 2>/dev/null; then
    # A lock older than two hours is a crashed run, not a live one.
    local age
    age=$(( $(date +%s) - $(stat -f %m "$LOCK_DIR" 2>/dev/null || echo 0) ))
    if [ "$age" -gt 7200 ]; then
      log "stale lock (${age}s old) — breaking it"
      rmdir "$LOCK_DIR" 2>/dev/null && mkdir "$LOCK_DIR" 2>/dev/null
    else
      status "SKIP: another pass is running (lock ${age}s old)"
      exit 0
    fi
  fi
  trap cleanup EXIT

  for binary in git gh claude fvm npm jq; do
    command -v "$binary" >/dev/null 2>&1 || { status "SKIP: $binary not on PATH"; exit 0; }
  done

  gh auth status >/dev/null 2>&1 || { status "SKIP: gh is not authenticated"; exit 0; }

  cd "$REPO_DIR" 2>/dev/null || { status "SKIP: $REPO_DIR is not there"; exit 0; }
  git fetch origin --quiet || { status "SKIP: git fetch failed"; exit 0; }

  # The runner works in its own worktree, so a dirty checkout in REPO_DIR is
  # the human's business and not a reason to skip. What it must not do is
  # touch that checkout: every git command below names a worktree explicitly.
  MAIN_SHA="$(git rev-parse origin/main)"
  log "run $RUN_ID · origin/main at ${MAIN_SHA:0:7}"
}

# ---------------------------------------------------------------------------
# GitHub helpers
# ---------------------------------------------------------------------------

# The one open pull request whose head branch belongs to the agent, if any.
open_agent_pr() {
  gh pr list --repo "$REPO_SLUG" --state open --json number,headRefName \
    --jq "[.[] | select(.headRefName | startswith(\"$BRANCH_PREFIX\"))] | first | .number // empty" 2>/dev/null
}

# Oldest open issue carrying the ready label. Oldest, not newest: the label is
# a queue, and a queue that serves the newest first starves its own backlog.
pick_ticket() {
  gh issue list --repo "$REPO_SLUG" --state open --label "$LABEL_READY" \
    --json number --jq 'sort_by(.number) | first | .number // empty' 2>/dev/null
}

issue_body() { gh issue view "$1" --repo "$REPO_SLUG" --json body --jq .body 2>/dev/null; }

issue_title() { gh issue view "$1" --repo "$REPO_SLUG" --json title --jq .title 2>/dev/null; }

# A branch name out of an issue title. Built with `tr` rather than a sed
# character-class repeat: BSD sed does not understand `\+`, and the version
# that did silently produced `agent/issue-5-settings screen: theme…`, which git
# then refused.
slugify() {
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | tr -c 'a-z0-9' '-' \
    | tr -s '-' \
    | cut -c1-40 \
    | sed -e 's/^-//' -e 's/-$//'
}

# Every call that changes something on GitHub goes through here, so --dry-run
# is one guard in one place instead of a condition at each call site.
gh_write() {
  if [ "$DRY_RUN" = "1" ]; then log "dry-run: would run gh $*"; return 0; fi
  gh "$@" >/dev/null 2>&1
}

relabel() { # relabel <issue> <add> <remove...>
  local issue="$1" add="$2"; shift 2
  local args=()
  [ -n "$add" ] && args+=(--add-label "$add")
  local rm
  for rm in "$@"; do args+=(--remove-label "$rm"); done
  [ "${#args[@]}" -eq 0 ] && return 0
  gh_write issue edit "$issue" --repo "$REPO_SLUG" "${args[@]}"
}

# ---------------------------------------------------------------------------
# Running the agent
# ---------------------------------------------------------------------------
#
# A portable watchdog: macOS ships no `timeout`. The agent runs in the
# background and a sleeper kills it if it overruns, so a wedged model costs one
# timeout and not a machine.
run_agent() {
  local worktree="$1" prompt_file="$2" label="$3"
  local out="$RUN_LOG_DIR/$RUN_ID.$label.agent.log"

  event "agent: $label starting (timeout ${AGENT_TIMEOUT_SECONDS}s)"

  (
    cd "$worktree" || exit 127
    # The two tool lists are deliberately word-split into separate arguments,
    # and globbing is off while that happens: patterns like `Edit(docs/**)` must
    # reach the CLI intact and not be expanded against the working tree.
    set -f
    # shellcheck disable=SC2086
    claude -p "$(cat "$prompt_file")" \
      --permission-mode acceptEdits \
      --permission-prompts none \
      --output-format text \
      --allowedTools $ALLOWED_TOOLS \
      --disallowedTools $DENIED_TOOLS
  ) >"$out" 2>&1 &
  local pid=$!

  ( sleep "$AGENT_TIMEOUT_SECONDS"; kill -TERM "$pid" 2>/dev/null ) &
  local killer=$!

  wait "$pid"; local rc=$?
  kill "$killer" 2>/dev/null; wait "$killer" 2>/dev/null

  if [ "$rc" -ge 128 ]; then
    event "agent: $label hit the ${AGENT_TIMEOUT_SECONDS}s timeout"
    return 124
  fi
  event "agent: $label finished rc=$rc (transcript: ${out##*/})"
  return "$rc"
}

# The agent's structured answer. It writes one word plus an optional reason to
# .factory-verdict; anything else it says is prose for the humans.
read_verdict() {
  local worktree="$1"
  if [ -f "$worktree/.factory-verdict" ]; then
    head -1 "$worktree/.factory-verdict"
    rm -f "$worktree/.factory-verdict"
  else
    echo "NO_VERDICT"
  fi
}

# ---------------------------------------------------------------------------
# The checks. This project has no tests by an explicit product decision, so
# "checks" means exactly what AGENTS.md calls Done minus the two halves a
# machine cannot do: analyze clean, and the Cloud Functions build and lint.
#
# The last step is the one worth reading. AGENTS.md rule 4 requires generated
# files to match their source *in the same commit*; regenerating and then
# demanding a clean tree is how that stops being a promise and starts being a
# check. It is the gate that would have caught the .g.dart that reached main
# calling a function its source had deleted.
# ---------------------------------------------------------------------------
run_checks() {
  local worktree="$1"
  local out="$RUN_LOG_DIR/$RUN_ID.checks.log"
  CHECK_FAILURE=""

  cd "$worktree" || { CHECK_FAILURE="worktree is gone"; return 1; }

  # firebase_options_{dev,prod}.dart are gitignored and firebase_bootstrap.dart
  # imports them, so a fresh worktree fails `analyze` with uri_does_not_exist
  # for a reason that has nothing to do with the change. The .example templates
  # carry placeholder values: enough to compile, useless for talking to Firebase.
  cp -n lib/core/firebase/firebase_options_dev.dart.example  lib/core/firebase/firebase_options_dev.dart  2>/dev/null
  cp -n lib/core/firebase/firebase_options_prod.dart.example lib/core/firebase/firebase_options_prod.dart 2>/dev/null
  cp -n env/example.json env/dev.json 2>/dev/null

  local step
  for step in \
    "fvm flutter pub get" \
    "fvm dart run slang" \
    "fvm dart run build_runner build" \
    "fvm dart format ." \
    "fvm flutter analyze"
  do
    event "check: $step"
    if ! { echo "### $step"; eval "$step"; } >>"$out" 2>&1; then
      CHECK_FAILURE="$step failed — see ${out##*/}"
      event "check FAILED: $step"
      return 1
    fi
  done

  # `analyze` exits 0 on warnings in some configurations; AGENTS.md says done
  # means the literal sentence, so that is what gets asserted.
  if ! grep -q "No issues found!" "$out"; then
    CHECK_FAILURE="flutter analyze did not end at 'No issues found!'"
    event "check FAILED: analyze was not clean"
    return 1
  fi

  if git diff --name-only "origin/main...HEAD" | grep -q '^functions/'; then
    event "check: functions build + lint (the diff touches functions/)"
    if ! { npm --prefix functions ci && npm --prefix functions run build && npm --prefix functions run lint; } >>"$out" 2>&1; then
      CHECK_FAILURE="the Cloud Functions build or lint failed — see ${out##*/}"
      return 1
    fi
  fi

  # The rule 4 gate: after regenerating, nothing may be uncommitted. The local
  # artefacts do not interfere — `firebase_options_*.dart` and `env/dev.json`
  # are gitignored and `.factory-*` is in this worktree's info/exclude, so
  # none of them appear in porcelain output.
  if [ -n "$(git status --porcelain)" ]; then
    CHECK_FAILURE="regenerating slang/build_runner left uncommitted changes: the committed generated files do not match their source (AGENTS.md rule 4)"
    event "check FAILED: rule 4 gate — generated files out of sync"
    git status --porcelain >>"$out" 2>&1
    return 1
  fi

  event "checks green: analyze clean, generated files in sync"
  return 0
}

# ---------------------------------------------------------------------------
# Finishing a pass
# ---------------------------------------------------------------------------

post_timeline() { # post_timeline <pr-or-issue> <heading>
  local number="$1" heading="$2"
  [ -f "$TIMELINE" ] || return 0
  { echo "### $heading"; echo; echo '```'; cat "$TIMELINE"; echo '```'; } \
    | gh_write pr comment "$number" --repo "$REPO_SLUG" --body-file -
}

finish_blocked() { # finish_blocked <issue> <pr-or-empty> <reason>
  local issue="$1" pr="$2" reason="$3"
  event "BLOCKED: $reason"
  relabel "$issue" "$LABEL_BLOCKED" "$LABEL_WORKING" "$LABEL_READY"
  if [ -n "$pr" ]; then
    gh_write pr edit "$pr" --repo "$REPO_SLUG" --add-label "$LABEL_BLOCKED"
    post_timeline "$pr" "Factory run $RUN_ID — stopped for help"
    gh_write pr comment "$pr" --repo "$REPO_SLUG" --body "**The factory stopped and is asking for help.**

$reason

Limits in force: $MAX_FIX_ROUNDS fix rounds, $MAX_REVIEW_ROUNDS review rounds, ${QODO_WAIT_MINUTES} min of reviewer silence. Nothing was merged and nothing was pushed to \`main\`.

To hand it back, fix what is in the way and move the label on the ticket from \`$LABEL_BLOCKED\` to \`$LABEL_READY\`."
  else
    gh_write issue comment "$issue" --repo "$REPO_SLUG" --body "**The factory stopped before opening a pull request.**

$reason"
  fi
  status "BLOCKED: $reason"
  exit 0
}

# ---------------------------------------------------------------------------
# Pass 1 — pick a ticket and deliver a pull request
# ---------------------------------------------------------------------------

implement_pass() {
  local issue
  issue="$(pick_ticket)"
  if [ -z "$issue" ]; then
    status "IDLE: no open issue carries $LABEL_READY"
    exit 0
  fi

  TIMELINE="$WORK_ROOT/issue-$issue.timeline"
  : >"$TIMELINE"
  event "picked issue #$issue from the $LABEL_READY queue"

  local title body
  title="$(issue_title "$issue")"
  body="$(issue_body "$issue")"

  # A ticket without acceptance criteria cannot be checked against acceptance
  # criteria. Refusing it here is cheaper than discovering it in review.
  if ! printf '%s' "$body" | grep -qiE '^#+[[:space:]]*acceptance criteria'; then
    relabel "$issue" "$LABEL_BLOCKED" "$LABEL_READY"
    gh_write issue comment "$issue" --repo "$REPO_SLUG" --body "**The factory declined this ticket.**

It has no \`## Acceptance criteria\` section, and the run is required to check the delivery against one. Add the section and move the label back to \`$LABEL_READY\`."
    status "BLOCKED: #$issue has no acceptance criteria"
    exit 0
  fi

  # Claim it before any work, so a second firing cannot take the same ticket.
  relabel "$issue" "$LABEL_WORKING" "$LABEL_READY"
  event "claimed: $LABEL_READY removed, $LABEL_WORKING added"

  local slug branch worktree
  slug="$(slugify "$title")"
  branch="$BRANCH_PREFIX$issue-$slug"
  worktree="$WORK_ROOT/issue-$issue"

  rm -rf "$worktree"
  git -C "$REPO_DIR" worktree prune
  git -C "$REPO_DIR" worktree add --force -B "$branch" "$worktree" "$MAIN_SHA" >>"$RUN_LOG" 2>&1 \
    || finish_blocked "$issue" "" "could not create the worktree for \`$branch\`"
  event "worktree at $worktree on \`$branch\` from ${MAIN_SHA:0:7}"

  # The verdict file and the local-only artefacts must never reach a commit.
  printf '.factory-verdict\n' >>"$worktree/.git/info/exclude" 2>/dev/null

  # pub get first, so the agent's own `analyze` is meaningful from its first call.
  ( cd "$worktree" \
      && cp -n lib/core/firebase/firebase_options_dev.dart.example  lib/core/firebase/firebase_options_dev.dart \
      && cp -n lib/core/firebase/firebase_options_prod.dart.example lib/core/firebase/firebase_options_prod.dart \
      && cp -n env/example.json env/dev.json \
      && fvm flutter pub get ) >>"$RUN_LOG" 2>&1

  local prompt="$worktree/.factory-prompt.md"
  sed -e "s|{{ISSUE}}|$issue|g" -e "s|{{BRANCH}}|$branch|g" -e "s|{{REPO}}|$REPO_SLUG|g" \
      "$FACTORY_DIR/playbook-implement.md" >"$prompt"
  printf '.factory-prompt.md\n' >>"$worktree/.git/info/exclude" 2>/dev/null

  local attempt=1 verdict=""
  while [ "$attempt" -le "$MAX_CHECK_ATTEMPTS" ]; do
    run_agent "$worktree" "$prompt" "implement-$attempt"
    verdict="$(read_verdict "$worktree")"
    event "agent verdict: $verdict"

    case "$verdict" in
      BLOCKED*) finish_blocked "$issue" "" "the agent stopped on its own: ${verdict#BLOCKED}" ;;
    esac

    if run_checks "$worktree"; then break; fi

    if [ "$attempt" -ge "$MAX_CHECK_ATTEMPTS" ]; then
      finish_blocked "$issue" "" "the checks were still red after $MAX_CHECK_ATTEMPTS attempts. Last failure: $CHECK_FAILURE"
    fi
    event "checks red on attempt $attempt of $MAX_CHECK_ATTEMPTS — handing the failure back"
    printf '\n\n---\n\n## The checks came back red\n\n%s\n\nFix the cause, commit, and write the verdict file again. This is attempt %s of %s.\n' \
      "$CHECK_FAILURE" "$((attempt + 1))" "$MAX_CHECK_ATTEMPTS" >>"$prompt"
    attempt=$((attempt + 1))
  done

  # Something has to have been committed, or there is nothing to review.
  local ahead
  ahead="$(git -C "$worktree" rev-list --count "$MAIN_SHA..HEAD")"
  [ "${ahead:-0}" -ge 1 ] || finish_blocked "$issue" "" "the agent committed nothing: there is no change to review"
  event "$ahead commit(s) on \`$branch\`"

  # `main` moving under a branch cut from an older commit is how two agents, or
  # an agent and a human, quietly produce a merge nobody reviewed.
  local main_now
  main_now="$(git -C "$REPO_DIR" rev-parse origin/main)"
  [ "$main_now" = "$MAIN_SHA" ] \
    || finish_blocked "$issue" "" "\`main\` moved from ${MAIN_SHA:0:7} to ${main_now:0:7} during the run; the branch was not pushed"

  if [ "$DRY_RUN" = "1" ]; then status "DRY_RUN: would push \`$branch\` and open a PR"; exit 0; fi

  # The push happens here and only here. The agent has no `git push`.
  git -C "$worktree" push --quiet -u origin "HEAD:refs/heads/$branch" \
    || finish_blocked "$issue" "" "pushing \`$branch\` failed"
  event "pushed \`$branch\`"

  local pr_body="$worktree/.factory-pr-body.md"
  [ -f "$pr_body" ] || finish_blocked "$issue" "" "the agent wrote no pull request body"

  local pr
  pr="$(gh pr create --repo "$REPO_SLUG" --base main --head "$branch" \
        --title "$(head -1 "$worktree/.factory-pr-title" 2>/dev/null || echo "$title")" \
        --body-file "$pr_body" 2>>"$RUN_LOG" | grep -oE '[0-9]+$' | tail -1)"
  [ -n "$pr" ] || finish_blocked "$issue" "" "opening the pull request failed"

  event "opened PR #$pr"
  post_timeline "$pr" "Factory run $RUN_ID — implementation"
  gh_write issue comment "$issue" --repo "$REPO_SLUG" \
    --body "The factory picked this up automatically and opened #$pr. Waiting for the Qodo review; up to $MAX_REVIEW_ROUNDS rounds and $MAX_FIX_ROUNDS fix rounds, then it stops for help."

  # Stop here on purpose. Qodo needs a few minutes, and a pass that waits is a
  # pass that holds the lock.
  status "PR_OPENED: #$pr"
}

# ---------------------------------------------------------------------------
# Pass 2..n — answer the review
# ---------------------------------------------------------------------------

review_pass() {
  local pr="$1"
  local branch issue worktree
  branch="$(gh pr view "$pr" --repo "$REPO_SLUG" --json headRefName --jq .headRefName)"
  issue="$(printf '%s' "$branch" | sed -E "s|^$BRANCH_PREFIX([0-9]+)-.*|\1|")"
  worktree="$WORK_ROOT/issue-$issue"
  TIMELINE="$WORK_ROOT/issue-$issue.timeline"

  event "review pass on PR #$pr (\`$branch\`, ticket #$issue)"

  [ -d "$worktree" ] || finish_blocked "$issue" "$pr" "the worktree for this PR is gone; it needs a human to resume it"

  # Rounds already used, read off the PR rather than remembered. Each round the
  # agent posts carries a machine-readable marker, so the count survives a
  # restart, a crash, and the agent having no memory of earlier passes.
  local comments rounds fixes
  comments="$(gh api "repos/$REPO_SLUG/issues/$pr/comments" --paginate --jq '.[].body' 2>/dev/null)"
  rounds="$(printf '%s' "$comments" | grep -c '<!-- factory round=' || true)"
  fixes="$(printf '%s' "$comments" | grep -oE '<!-- factory round=[0-9]+ fixes=[0-9]+' | grep -oE 'fixes=[0-9]+' | cut -d= -f2 | awk '{s+=$1} END {print s+0}')"
  rounds="${rounds:-0}"; fixes="${fixes:-0}"
  event "rounds used $rounds/$MAX_REVIEW_ROUNDS · fix rounds used $fixes/$MAX_FIX_ROUNDS"

  # Is there a Qodo review newer than the commit it would be reviewing? A stale
  # review is the trap UBayouski documented: a green-looking run that answered
  # a review of code that no longer exists.
  local head_time qodo_time
  head_time="$(gh pr view "$pr" --repo "$REPO_SLUG" --json commits --jq '.commits | last | .committedDate')"
  qodo_time="$(gh api "repos/$REPO_SLUG/issues/$pr/comments" --paginate \
    --jq '[.[] | select(.user.login == "qodo-code-review[bot]")] | last | .updated_at // empty' 2>/dev/null)"

  # ISO 8601 UTC sorts lexically, so a string comparison is the date comparison.
  if [ -z "$qodo_time" ] || [[ "$qodo_time" < "$head_time" ]]; then
    local pushed_ago
    pushed_ago=$(( ( $(date +%s) - $(date -j -f %Y-%m-%dT%H:%M:%SZ "$head_time" +%s 2>/dev/null || echo 0) ) / 60 ))
    if [ "$pushed_ago" -gt "$QODO_WAIT_MINUTES" ]; then
      finish_blocked "$issue" "$pr" "no Qodo review of the current head commit after ${pushed_ago} minutes (limit ${QODO_WAIT_MINUTES}). The reviewer may be down, or it may be ignoring this PR."
    fi
    event "no review of the head commit yet (${pushed_ago} min of ${QODO_WAIT_MINUTES})"
    status "WAITING_QODO: ${pushed_ago}/${QODO_WAIT_MINUTES} min"
    exit 0
  fi

  if [ "$rounds" -ge "$MAX_REVIEW_ROUNDS" ]; then
    finish_blocked "$issue" "$pr" "the $MAX_REVIEW_ROUNDS-round review limit is used up and the reviewer is still talking. The open findings are yours."
  fi

  local round=$((rounds + 1))
  local prompt="$worktree/.factory-prompt.md"
  sed -e "s|{{ISSUE}}|$issue|g" -e "s|{{PR}}|$pr|g" -e "s|{{ROUND}}|$round|g" \
      -e "s|{{FIXES_USED}}|$fixes|g" -e "s|{{MAX_FIXES}}|$MAX_FIX_ROUNDS|g" -e "s|{{REPO}}|$REPO_SLUG|g" \
      "$FACTORY_DIR/playbook-review.md" >"$prompt"

  run_agent "$worktree" "$prompt" "review-$round"
  local verdict; verdict="$(read_verdict "$worktree")"
  event "agent verdict: $verdict"

  case "$verdict" in
    NO_FINDINGS)
      relabel "$issue" "$LABEL_DONE" "$LABEL_WORKING"
      gh_write pr edit "$pr" --repo "$REPO_SLUG" --add-label "$LABEL_DONE"
      post_timeline "$pr" "Factory run $RUN_ID — review round $round"
      gh_write pr comment "$pr" --repo "$REPO_SLUG" --body "**Ready for you.** The Qodo review of the current head commit has no open finding, the checks are green, and the factory is done with this one.

It did not merge and will not: that call is yours. See the acceptance-criteria section of the description for what was verified and what a machine in this project cannot verify."
      status "READY: #$pr"
      exit 0
      ;;
    BLOCKED*)
      finish_blocked "$issue" "$pr" "the agent stopped on its own: ${verdict#BLOCKED}"
      ;;
    FIXED)
      if [ "$fixes" -ge "$MAX_FIX_ROUNDS" ]; then
        finish_blocked "$issue" "$pr" "the $MAX_FIX_ROUNDS fix rounds are used up and findings are still open."
      fi
      ;;
    REJECTED_ALL)
      : # the agent answered every finding in writing and changed nothing.
      ;;
    *)
      finish_blocked "$issue" "$pr" "the agent returned no usable verdict (got '$verdict')"
      ;;
  esac

  if [ "$verdict" = "FIXED" ]; then
    run_checks "$worktree" || finish_blocked "$issue" "$pr" "the checks went red answering the review: $CHECK_FAILURE"
    # No "did main move" guard here, unlike the implement pass: this push goes
    # to the agent's own branch, which `main` moving does not endanger. Whether
    # a stale branch is still worth merging is the human's call at merge time.
    if [ "$DRY_RUN" = "1" ]; then status "DRY_RUN: would push round $round"; exit 0; fi
    git -C "$worktree" push --quiet origin "HEAD:refs/heads/$branch" \
      || finish_blocked "$issue" "$pr" "pushing round $round failed"
    event "pushed round $round — back to waiting for the reviewer"
  fi

  post_timeline "$pr" "Factory run $RUN_ID — review round $round"
  status "ROUND: $round done on #$pr (verdict $verdict)"
}

# ---------------------------------------------------------------------------

main() {
  preflight
  local pr; pr="$(open_agent_pr)"
  if [ -n "$pr" ]; then review_pass "$pr"; else implement_pass; fi
}

main "$@"
