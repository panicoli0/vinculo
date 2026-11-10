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
#   3. **The agent talks to nothing.** It has no `gh`, no network, and no git
#      command that can write outside the index. The runner fetches the ticket,
#      the review and the diff into files, and the runner posts whatever the
#      agent wrote. So text arriving from an issue body or a review comment has
#      no path to `main` and no path to the GitHub API.
#   4. It never merges and never closes anything. The human merges.
#
# Status lines on stdout are the contract with launchd and with a human
# reading the log: IDLE, SKIP, PR_OPENED, WAITING_QODO, ROUND, READY, BLOCKED.
#
# Usage:
#   factory/agent-run.sh            one pass
#   factory/agent-run.sh --dry-run  preflight, queue and ticket gate only.
#                                   Creates no worktree and runs no agent.
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
MAX_FIX_ROUNDS="${FACTORY_MAX_FIX_ROUNDS:-2}"         # rounds in which the agent changes code for Qodo
MAX_REVIEW_ROUNDS="${FACTORY_MAX_REVIEW_ROUNDS:-3}"   # total rounds of review answered
MAX_CHECK_ATTEMPTS="${FACTORY_MAX_CHECK_ATTEMPTS:-2}" # attempts to get the checks green while implementing
QODO_WAIT_MINUTES="${FACTORY_QODO_WAIT_MINUTES:-45}"  # silence from the reviewer after which we stop
AGENT_TIMEOUT_SECONDS="${FACTORY_AGENT_TIMEOUT:-2700}"
STEP_TIMEOUT_SECONDS="${FACTORY_STEP_TIMEOUT:-900}"   # any single build or check step
QUEUE_LIMIT="${FACTORY_QUEUE_LIMIT:-200}"             # issues fetched when reading the queue
FVM_CACHE="${FVM_CACHE_PATH:-$HOME/fvm/versions}"

LABEL_READY="ready-for-agent"
LABEL_WORKING="agent-working"
LABEL_DONE="agent-ready"
LABEL_BLOCKED="agent-blocked"

BRANCH_PREFIX="agent/issue-"
FACTORY_DIR="$REPO_DIR/factory"
RUN_LOG_DIR="$FACTORY_DIR/runs"
LOCK_DIR="$WORK_ROOT/.lock"

# Everything the runner hands the agent, and everything the agent hands back,
# lives in this one directory inside the worktree. One name to exclude, and the
# clean-tree gate below stays meaningful.
IO_DIR=".factory"

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
# is additive to whatever the host's own settings already permit, and a
# headless run inherits that. Deny rules win over allow rules wherever they
# overlap, so everything that must never happen is named below rather than
# merely left out above.
#
# The allow list is deliberately tiny, and three findings from this runner's
# own review are the reason:
#
#   * No `gh` at all. `gh api repos/<slug>:*` looked read-only and is not —
#     the same command reaches every write endpoint on the repository,
#     including merge, with the runner's credentials. The runner now fetches
#     the ticket, the review and the diff into files, and posts what the agent
#     wrote. The agent reads and writes files; it does not talk to GitHub.
#   * No `git diff`, `git show` or `git log`. All three accept `--output=`,
#     which writes a file through git and walks straight past a path-based
#     `Edit()`/`Write()` denial.
#   * `npm --prefix functions` is pinned to three exact scripts. A wildcard
#     there also allows `npm run deploy`, which is `firebase deploy` wearing a
#     different hat, and `Bash(firebase:*)` never sees it.
#
# The interpreters are denied by name for the same reason: an agent that can
# run `python` or a nested shell can do whatever they can, and the allow list
# stops meaning what it says. Every prefix pattern ends in `:*` — a wildcard
# earlier would also match options inserted at that position.
# ---------------------------------------------------------------------------
# These are **arrays**, and the difference is not style. A pattern containing a
# space has to reach the CLI as one argument. Held in a string and expanded
# unquoted, `Bash(npm --prefix functions ci)` splits into four arguments and
# the CLI reads `--prefix` as one of its own options: the run died in one
# second with `error: unknown option '--prefix'`. The patterns that do not
# begin with a dash fail more quietly — `Bash(fvm flutter analyze)` arrives as
# three meaningless fragments and simply never matches anything, which is an
# allow list that silently allows nothing.
ALLOWED_TOOLS=(
  Read Glob Grep Edit Write TodoWrite
  "Bash(fvm flutter analyze)"
  "Bash(fvm flutter pub get)"
  "Bash(fvm dart run slang)"
  "Bash(fvm dart run build_runner build)"
  "Bash(fvm dart format .)"
  "Bash(git status)"
  "Bash(git add:*)"
  "Bash(git commit:*)"
  "Bash(npm --prefix functions ci)"
  "Bash(npm --prefix functions run build)"
  "Bash(npm --prefix functions run lint)"
)

DENIED_TOOLS=(
  "Bash(gh:*)"
  "Bash(git push:*)" "Bash(git merge:*)" "Bash(git rebase:*)" "Bash(git reset:*)"
  "Bash(git checkout:*)" "Bash(git switch:*)" "Bash(git branch:*)" "Bash(git worktree:*)"
  "Bash(git remote:*)" "Bash(git clean:*)" "Bash(git config:*)" "Bash(git apply:*)"
  "Bash(git diff:*)" "Bash(git show:*)" "Bash(git log:*)" "Bash(git format-patch:*)"
  "Bash(firebase:*)" "Bash(gcloud:*)" "Bash(flutterfire:*)" "Bash(gsutil:*)" "Bash(aws:*)"
  "Bash(rm:*)" "Bash(mv:*)" "Bash(cp:*)" "Bash(chmod:*)" "Bash(chown:*)" "Bash(ln:*)"
  "Bash(sudo:*)" "Bash(su:*)" "Bash(curl:*)" "Bash(wget:*)" "Bash(ssh:*)" "Bash(scp:*)" "Bash(nc:*)"
  "Bash(launchctl:*)" "Bash(crontab:*)" "Bash(defaults:*)" "Bash(security:*)" "Bash(open:*)"
  "Bash(osascript:*)" "Bash(env:*)" "Bash(xargs:*)" "Bash(eval:*)" "Bash(exec:*)" "Bash(tee:*)"
  "Bash(python:*)" "Bash(python3:*)" "Bash(perl:*)" "Bash(ruby:*)" "Bash(node:*)" "Bash(npx:*)"
  "Bash(sh:*)" "Bash(bash:*)" "Bash(zsh:*)" "Bash(dart:*)" "Bash(flutter:*)"
  WebFetch WebSearch
  # Paths are denied with Edit() only. A `Write(path)` rule is silently inert —
  # the CLI says so on every run: "Write(docs/**) is not matched by file
  # permission checks — only Edit(path) rules are." An `Edit()` rule covers all
  # file-editing tools, Write included, so the pairs these used to come in were
  # half decoration.
  "Edit(assets/content/decks/**)"
  "Edit(factory/**)"
  "Edit(docs/**)"
  "Edit(.qodo/**)"
  "Edit(.github/**)"
  "Edit(.gitignore)"
)

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
HOLD_LOCK=0   # only the run that acquired the lock may remove it

now_utc() { date -u +%Y-%m-%dT%H:%M:%SZ; }
log() { printf '%s  %s\n' "$(now_utc)" "$*" | tee -a "$RUN_LOG"; }
status() { printf '%s\n' "$*" | tee -a "$RUN_LOG"; }

event() {
  log "$*"
  [ -n "$TIMELINE" ] && printf '%s  %s\n' "$(now_utc)" "$*" >>"$TIMELINE"
  return 0
}

cleanup() {
  # Only tear down a lock this run actually owns. A run that lost the race for
  # a broken stale lock must not remove the winner's.
  [ "$HOLD_LOCK" = "1" ] && [ -d "$LOCK_DIR" ] && rmdir "$LOCK_DIR" 2>/dev/null
  return 0
}

# ---------------------------------------------------------------------------
# Preflight
# ---------------------------------------------------------------------------

preflight() {
  if ! mkdir "$LOCK_DIR" 2>/dev/null; then
    local age
    age=$(( $(date +%s) - $(stat -f %m "$LOCK_DIR" 2>/dev/null || echo 0) ))
    if [ "$age" -gt 7200 ]; then
      log "stale lock (${age}s old) — breaking it"
      rmdir "$LOCK_DIR" 2>/dev/null
      # Someone else may have taken it in the gap. Only proceed if this mkdir
      # is the one that succeeded.
      if ! mkdir "$LOCK_DIR" 2>/dev/null; then
        status "SKIP: lost the race for the stale lock"
        exit 0
      fi
    else
      status "SKIP: another pass is running (lock ${age}s old)"
      exit 0
    fi
  fi
  HOLD_LOCK=1
  trap cleanup EXIT

  local binary
  for binary in git gh claude fvm npm jq; do
    command -v "$binary" >/dev/null 2>&1 || { status "SKIP: $binary not on PATH"; exit 0; }
  done
  gh auth status >/dev/null 2>&1 || { status "SKIP: gh is not authenticated"; exit 0; }

  # The pinned SDK has to be in the cache before anything calls `fvm`.
  #
  # When it is missing, fvm does not fail: it asks "Would you like to install
  # it now?" and, with no terminal attached, spins at full CPU forever instead
  # of answering itself. Redirecting stdin from /dev/null does not stop it, and
  # this version has no `--skip-input`. It is the same shape as the
  # `flutterfire` hang this project already documented.
  #
  # So the cache is checked on disk, which cannot hang, and a missing SDK ends
  # the pass in one readable line rather than eighteen minutes of nothing.
  local pinned
  pinned="$(jq -r '.flutter // empty' "$REPO_DIR/.fvmrc" 2>/dev/null)"
  if [ -n "$pinned" ] && [ ! -d "$FVM_CACHE/$pinned" ]; then
    status "SKIP: Flutter $pinned is pinned in .fvmrc but is not in the fvm cache ($FVM_CACHE). Run 'fvm install $pinned --setup' — until then every fvm command prompts to install it and hangs instead of failing."
    exit 0
  fi

  cd "$REPO_DIR" 2>/dev/null || { status "SKIP: $REPO_DIR is not there"; exit 0; }
  git fetch origin --quiet || { status "SKIP: git fetch failed"; exit 0; }

  # The runner works in its own worktree, so a dirty checkout in REPO_DIR is
  # the human's business and not a reason to skip.
  MAIN_SHA="$(git rev-parse origin/main)"
  log "run $RUN_ID · origin/main at ${MAIN_SHA:0:7}"
}

# ---------------------------------------------------------------------------
# GitHub helpers. Every call that changes something goes through gh_write, so
# --dry-run is one guard in one place instead of a condition at each call site.
# ---------------------------------------------------------------------------

gh_write() {
  if [ "$DRY_RUN" = "1" ]; then log "dry-run: would run gh $*"; return 0; fi
  gh "$@" >/dev/null 2>&1
}

relabel() { # relabel <issue> <add> <remove...>  — returns nonzero if GitHub refused
  local issue="$1" add="$2"; shift 2
  local args=()
  [ -n "$add" ] && args+=(--add-label "$add")
  local rm
  for rm in "$@"; do args+=(--remove-label "$rm"); done
  [ "${#args[@]}" -eq 0 ] && return 0
  gh_write issue edit "$issue" --repo "$REPO_SLUG" "${args[@]}"
}

# The one open pull request this runner is still working on. A pull request it
# has finished with — `agent-ready` or `agent-blocked` — is deliberately left
# open for the human, and must not keep the queue from moving.
open_agent_pr() {
  gh pr list --repo "$REPO_SLUG" --state open --limit "$QUEUE_LIMIT" \
    --json number,headRefName,labels \
    --jq "[.[]
           | select(.headRefName | startswith(\"$BRANCH_PREFIX\"))
           | select([.labels[].name] | any(. == \"$LABEL_DONE\" or . == \"$LABEL_BLOCKED\") | not)]
          | sort_by(.number) | first | .number // empty" 2>/dev/null
}

# Oldest open issue carrying the ready label. Oldest, not newest: the label is
# a queue, and a queue that serves the newest first starves its own backlog.
# The explicit limit matters — `gh issue list` defaults to 30, so without it a
# long queue silently stops being a queue.
pick_ticket() {
  gh issue list --repo "$REPO_SLUG" --state open --label "$LABEL_READY" \
    --limit "$QUEUE_LIMIT" --json number \
    --jq 'sort_by(.number) | first | .number // empty' 2>/dev/null
}

slugify() {
  # Built with `tr` rather than a sed character-class repeat: BSD sed does not
  # understand `\+`, and the version that did silently produced
  # `agent/issue-5-settings screen: theme…`, which git then refused.
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | tr -c 'a-z0-9' '-' \
    | tr -s '-' \
    | cut -c1-40 \
    | sed -e 's/^-//' -e 's/-$//'
}

# ---------------------------------------------------------------------------
# Timeouts
# ---------------------------------------------------------------------------
#
# macOS ships no `timeout`, so this is it. **Every** external command the
# runner starts goes through here, not just the agent.
#
# That generality is the lesson of a real stall: `fvm flutter pub get` found
# the pinned SDK missing, asked "Would you like to install it now?", and with
# no terminal attached spun at 91% CPU for eighteen minutes. The agent had a
# watchdog and nothing else did, so the pass held the lock and the ticket sat
# in `agent-working` with no pull request. A step with no timeout is a step
# that can stop the factory.
#
# The command runs in its own process group and the timeout signals the group,
# so a tool it started cannot outlive it and keep writing into the worktree.
#
# Usage:  with_timeout <seconds> <label> <command...>   [redirections as usual]
with_timeout() {
  local secs="$1" label="$2"; shift 2
  set -m
  ( "$@" ) &
  local pid=$!
  set +m
  (
    sleep "$secs"
    kill -TERM -"$pid" 2>/dev/null || kill -TERM "$pid" 2>/dev/null
    sleep 10
    kill -KILL -"$pid" 2>/dev/null || kill -KILL "$pid" 2>/dev/null
  ) &
  local killer=$!
  wait "$pid"; local rc=$?
  kill "$killer" 2>/dev/null; wait "$killer" 2>/dev/null
  if [ "$rc" -ge 128 ]; then
    TIMED_OUT="$label"
    event "TIMEOUT after ${secs}s: $label"
    return 124
  fi
  return "$rc"
}

# ---------------------------------------------------------------------------
# Running the agent
# ---------------------------------------------------------------------------
run_agent() {
  local worktree="$1" prompt_file="$2" label="$3"
  local out="$RUN_LOG_DIR/$RUN_ID.$label.agent.log"

  event "agent: $label starting (timeout ${AGENT_TIMEOUT_SECONDS}s)"

  run_claude() {
    cd "$worktree" || exit 127
    # Quoted array expansion: one pattern per argument, no word splitting and
    # no globbing, so `Bash(fvm flutter analyze)` and `Edit(docs/**)` both
    # reach the CLI exactly as written.
    claude -p "$(cat "$prompt_file")" \
      --permission-mode acceptEdits \
      --permission-prompts none \
      --output-format text \
      --allowedTools "${ALLOWED_TOOLS[@]}" \
      --disallowedTools "${DENIED_TOOLS[@]}"
  }

  with_timeout "$AGENT_TIMEOUT_SECONDS" "agent $label" run_claude >"$out" 2>&1
  local rc=$?
  [ "$rc" = "124" ] && return 124
  event "agent: $label finished rc=$rc (transcript: ${out##*/})"
  return "$rc"
}

read_verdict() {
  local worktree="$1"
  if [ -f "$worktree/$IO_DIR/verdict" ]; then
    head -1 "$worktree/$IO_DIR/verdict"
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
  local out="$RUN_LOG_DIR/$RUN_ID.checks.$(date -u +%H%M%S).log"
  # `.analyze.log`, not `.log.analyze`: the repository ignores `*.log`, and a
  # file whose name ends otherwise turns `factory/runs/` into untracked clutter
  # that eventually gets committed by someone's `git add -A`.
  local analyze_out="${out%.log}.analyze.log"
  CHECK_FAILURE=""

  cd "$worktree" || { CHECK_FAILURE="worktree is gone"; return 1; }

  # firebase_options_{dev,prod}.dart are gitignored and firebase_bootstrap.dart
  # imports them, so a fresh worktree fails `analyze` with uri_does_not_exist
  # for a reason that has nothing to do with the change. The .example templates
  # carry placeholder values: enough to compile, useless for talking to Firebase.
  cp -n lib/core/firebase/firebase_options_dev.dart.example  lib/core/firebase/firebase_options_dev.dart  2>/dev/null
  cp -n lib/core/firebase/firebase_options_prod.dart.example lib/core/firebase/firebase_options_prod.dart 2>/dev/null
  cp -n env/example.json env/dev.json 2>/dev/null

  # Each step is an argument list, not a string fed to `eval`, and each one is
  # bounded. A build step that hangs used to hang the whole factory.
  run_step() { # run_step <label> <command...>
    local label="$1"; shift
    event "check: $label"
    echo "### $label" >>"$out"
    if ! with_timeout "$STEP_TIMEOUT_SECONDS" "$label" "$@" >>"$out" 2>&1; then
      if [ "${TIMED_OUT:-}" = "$label" ]; then
        CHECK_FAILURE="$label did not finish within ${STEP_TIMEOUT_SECONDS}s"
      else
        CHECK_FAILURE="$label failed — see ${out##*/}"
      fi
      event "check FAILED: $label"
      return 1
    fi
    return 0
  }

  run_step "fvm flutter pub get"              fvm flutter pub get              || return 1
  run_step "fvm dart run slang"               fvm dart run slang               || return 1
  run_step "fvm dart run build_runner build"  fvm dart run build_runner build  || return 1
  run_step "fvm dart format ."                fvm dart format .                || return 1

  # `analyze` goes to its own file, truncated every time. Appending retries to
  # one log and grepping the whole thing lets an earlier attempt's clean line
  # vouch for a later attempt that was not clean.
  event "check: fvm flutter analyze"
  with_timeout "$STEP_TIMEOUT_SECONDS" "fvm flutter analyze" fvm flutter analyze >"$analyze_out" 2>&1
  cat "$analyze_out" >>"$out"
  if ! grep -q "No issues found!" "$analyze_out"; then
    CHECK_FAILURE="flutter analyze did not end at 'No issues found!' — see ${analyze_out##*/}"
    event "check FAILED: analyze was not clean"
    return 1
  fi

  if git diff --name-only "$MAIN_SHA...HEAD" | grep -q '^functions/'; then
    run_step "npm --prefix functions ci"        npm --prefix functions ci        || return 1
    run_step "npm --prefix functions run build" npm --prefix functions run build || return 1
    run_step "npm --prefix functions run lint"  npm --prefix functions run lint  || return 1
  fi

  # The rule 4 gate: after regenerating, nothing may be uncommitted. The local
  # artefacts do not interfere — `firebase_options_*.dart` and `env/dev.json`
  # are gitignored, and `.factory/` is excluded in this worktree.
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

post_timeline() {
  local number="$1" heading="$2"
  [ -n "$TIMELINE" ] && [ -f "$TIMELINE" ] || return 0
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

finish_ready() { # finish_ready <issue> <pr> <note>
  local issue="$1" pr="$2" note="$3"
  relabel "$issue" "$LABEL_DONE" "$LABEL_WORKING"
  gh_write pr edit "$pr" --repo "$REPO_SLUG" --add-label "$LABEL_DONE"
  post_timeline "$pr" "Factory run $RUN_ID — ready"
  gh_write pr comment "$pr" --repo "$REPO_SLUG" --body "**Ready for you.** $note

The checks were re-run at this point and are green. It did not merge and will not: that call is yours. See the acceptance-criteria section of the description for what was verified, and the *Not verified* section for what a scheduled job in this project cannot verify at all."
  status "READY: #$pr"
  exit 0
}

# Prepare the worktree's exclude file. A linked worktree has a `.git` **file**,
# not a directory, so `$worktree/.git/info/exclude` is a path that does not
# exist and writing to it silently does nothing — which left every `.factory/`
# artefact untracked and failed the clean-tree gate on every ticket.
exclude_io_dir() {
  local worktree="$1" exclude
  exclude="$(git -C "$worktree" rev-parse --git-path info/exclude 2>/dev/null)"
  [ -n "$exclude" ] || return 1
  case "$exclude" in /*) ;; *) exclude="$worktree/$exclude" ;; esac
  mkdir -p "$(dirname "$exclude")" || return 1
  grep -qx "/$IO_DIR/" "$exclude" 2>/dev/null || printf '/%s/\n' "$IO_DIR" >>"$exclude"
  # Prove it took, rather than trusting the write.
  mkdir -p "$worktree/$IO_DIR" && : >"$worktree/$IO_DIR/.probe"
  [ -z "$(git -C "$worktree" status --porcelain)" ]
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
  title="$(gh issue view "$issue" --repo "$REPO_SLUG" --json title --jq .title 2>/dev/null)"
  body="$(gh issue view "$issue" --repo "$REPO_SLUG" --json body --jq .body 2>/dev/null)"
  [ -n "$title" ] || { status "SKIP: could not read issue #$issue"; exit 0; }

  # A ticket without acceptance criteria cannot be checked against acceptance
  # criteria. Refusing it here is cheaper than discovering it in review.
  if ! printf '%s' "$body" | grep -qiE '^#+[[:space:]]*acceptance criteria'; then
    relabel "$issue" "$LABEL_BLOCKED" "$LABEL_READY"
    gh_write issue comment "$issue" --repo "$REPO_SLUG" --body "**The factory declined this ticket.**

It has no \`## Acceptance criteria\` section, and the run is required to check the delivery against one. Add the section and move the label back to \`$LABEL_READY\`."
    status "BLOCKED: #$issue has no acceptance criteria"
    exit 0
  fi

  # Everything above this line only reads. --dry-run stops here, before the
  # first thing that changes the machine or the repository: the documented
  # contract is "preflight and ticket pick", and a dry run that resets a
  # worktree and starts an agent is not that.
  if [ "$DRY_RUN" = "1" ]; then
    status "DRY_RUN: would claim #$issue ($title) and start the implement pass"
    exit 0
  fi

  # Claim it before any work, so a second firing cannot take the same ticket.
  # If GitHub refuses the write, stop: proceeding would race another pass.
  if ! relabel "$issue" "$LABEL_WORKING" "$LABEL_READY"; then
    status "SKIP: could not claim #$issue (GitHub refused the label change)"
    exit 0
  fi
  event "claimed: $LABEL_READY removed, $LABEL_WORKING added"

  local slug branch worktree
  slug="$(slugify "$title")"
  branch="$BRANCH_PREFIX$issue-$slug"
  worktree="$WORK_ROOT/issue-$issue"

  rm -rf "$worktree"
  git -C "$REPO_DIR" worktree prune
  with_timeout "$STEP_TIMEOUT_SECONDS" "git worktree add" \
      git -C "$REPO_DIR" worktree add --force -B "$branch" "$worktree" "$MAIN_SHA" >>"$RUN_LOG" 2>&1 \
    || finish_blocked "$issue" "" "could not create the worktree for \`$branch\`"
  exclude_io_dir "$worktree" \
    || finish_blocked "$issue" "" "could not make \`$IO_DIR/\` invisible to git in the worktree; the clean-tree gate would reject every delivery"
  event "worktree at $worktree on \`$branch\` from ${MAIN_SHA:0:7}"

  # The agent has no `gh`. Everything it needs about the ticket arrives as a file.
  printf '# Ticket #%s — %s\n\n%s\n' "$issue" "$title" "$body" >"$worktree/$IO_DIR/ticket.md"

  # Seed the local-only files and warm pub, so the agent's first `analyze` is
  # meaningful. Bounded like everything else: this is the step whose unbounded
  # version spun for eighteen minutes on a missing SDK prompt.
  prepare_worktree() {
    cd "$worktree" || return 1
    cp -n lib/core/firebase/firebase_options_dev.dart.example  lib/core/firebase/firebase_options_dev.dart
    cp -n lib/core/firebase/firebase_options_prod.dart.example lib/core/firebase/firebase_options_prod.dart
    cp -n env/example.json env/dev.json
    fvm flutter pub get
  }
  with_timeout "$STEP_TIMEOUT_SECONDS" "prepare worktree" prepare_worktree >>"$RUN_LOG" 2>&1 \
    || finish_blocked "$issue" "" "preparing the worktree failed or timed out before the agent started"

  local prompt="$worktree/$IO_DIR/prompt.md"
  sed -e "s|{{ISSUE}}|$issue|g" -e "s|{{BRANCH}}|$branch|g" -e "s|{{REPO}}|$REPO_SLUG|g" \
      -e "s|{{IO}}|$IO_DIR|g" \
      "$FACTORY_DIR/playbook-implement.md" >"$prompt"

  local attempt=1 verdict=""
  while [ "$attempt" -le "$MAX_CHECK_ATTEMPTS" ]; do
    run_agent "$worktree" "$prompt" "implement-$attempt"
    verdict="$(read_verdict "$worktree")"
    event "agent verdict: $verdict"

    case "$verdict" in
      # `BLOCKED: reason` — strip the label and the separator, not just the
      # label, or the message reads "stopped on its own: : reason".
      BLOCKED*) finish_blocked "$issue" "" "the agent stopped on its own — ${verdict#BLOCKED: }" ;;
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

  local ahead
  ahead="$(git -C "$worktree" rev-list --count "$MAIN_SHA..HEAD")"
  [ "${ahead:-0}" -ge 1 ] || finish_blocked "$issue" "" "the agent committed nothing: there is no change to review"
  event "$ahead commit(s) on \`$branch\`"

  # Check for the description *before* the push. A branch on the remote with no
  # pull request behind it is litter the human has to clean up.
  local pr_body="$worktree/$IO_DIR/pr-body.md"
  [ -s "$pr_body" ] || finish_blocked "$issue" "" "the agent wrote no pull request body, so nothing was pushed"

  # `main` moving under a branch cut from an older commit is how an agent and a
  # human quietly produce a merge nobody reviewed. Re-fetch first: comparing a
  # cached remote-tracking ref against itself can only ever be equal.
  git -C "$REPO_DIR" fetch origin main --quiet
  local main_now
  main_now="$(git -C "$REPO_DIR" rev-parse origin/main)"
  [ "$main_now" = "$MAIN_SHA" ] \
    || finish_blocked "$issue" "" "\`main\` moved from ${MAIN_SHA:0:7} to ${main_now:0:7} during the run; the branch was not pushed"

  git -C "$worktree" push --quiet -u origin "HEAD:refs/heads/$branch" \
    || finish_blocked "$issue" "" "pushing \`$branch\` failed"
  event "pushed \`$branch\`"

  local pr
  pr="$(gh pr create --repo "$REPO_SLUG" --base main --head "$branch" \
        --title "$(head -1 "$worktree/$IO_DIR/pr-title" 2>/dev/null || echo "$title")" \
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

  local head_sha
  head_sha="$(git -C "$worktree" rev-parse HEAD)"

  # Rounds already used, read off the pull request rather than remembered. The
  # runner writes these markers itself — an earlier version trusted the agent
  # to write them, so a failed post or a malformed marker reset the count and
  # the limits stopped limiting.
  local comments rounds fixes answered
  comments="$(gh api "repos/$REPO_SLUG/issues/$pr/comments" --paginate --jq '.[].body' 2>/dev/null)"
  rounds="$(printf '%s' "$comments" | grep -c '<!-- factory round=' || true)"
  fixes="$(printf '%s' "$comments" | grep -oE 'fixes=[0-9]+' | cut -d= -f2 | awk '{s+=$1} END {print s+0}')"
  answered="$(printf '%s' "$comments" | grep -oE 'head=[0-9a-f]+' | cut -d= -f2)"
  rounds="${rounds:-0}"; fixes="${fixes:-0}"
  event "rounds used $rounds/$MAX_REVIEW_ROUNDS · fix rounds used $fixes/$MAX_FIX_ROUNDS · head ${head_sha:0:7}"

  # Already answered a review of this exact commit? Then nothing has moved and
  # there is nothing new to answer; re-answering would burn rounds on the same
  # text. This is also what stops a `FIXED` verdict that committed nothing from
  # spending the budget.
  if printf '%s\n' "$answered" | grep -qx "$head_sha"; then
    event "a round for head ${head_sha:0:7} is already on the pull request"
    status "WAITING_QODO: head ${head_sha:0:7} already answered"
    exit 0
  fi

  # Qodo leaves more than one kind of comment: a summary, a link, and the
  # review itself. Only the last carries findings, so it is selected by its
  # heading — on an earlier pull request the newest bot comment was a one-line
  # link, and taking it would have had the agent answer a review it never read.
  # Both timestamps must be UTC or the lexical comparison below is nonsense.
  # `%cI` renders the committer's local offset (`…+01:00`), which sorts after
  # a `…Z` string of the same instant and would make a fresh review look stale.
  local head_time qodo_time
  head_time="$(TZ=UTC0 git -C "$worktree" show -s \
                 --date=format-local:'%Y-%m-%dT%H:%M:%SZ' --format=%cd HEAD)"
  qodo_time="$(gh api "repos/$REPO_SLUG/issues/$pr/comments" --paginate \
    --jq '[.[] | select(.user.login == "qodo-code-review[bot]")
               | select(.body | startswith("<h3>Code Review by Qodo"))]
          | max_by(.updated_at) | .updated_at // empty' 2>/dev/null)"

  if [ -z "$qodo_time" ] || [[ "$qodo_time" < "$head_time" ]]; then
    local pushed_ago
    # BSD `date -j -f` reads the string in the local zone, so it needs TZ=UTC0
    # to parse a `…Z` timestamp as the instant it actually names.
    pushed_ago=$(( ( $(date +%s) - $(TZ=UTC0 date -j -f '%Y-%m-%dT%H:%M:%SZ' "$head_time" +%s 2>/dev/null || echo 0) ) / 60 ))
    if [ "$pushed_ago" -gt "$QODO_WAIT_MINUTES" ]; then
      finish_blocked "$issue" "$pr" "no Qodo review of the current head commit after ${pushed_ago} minutes (limit ${QODO_WAIT_MINUTES}). The reviewer may be down, or it may be ignoring this pull request."
    fi
    event "no review of the head commit yet (${pushed_ago} min of ${QODO_WAIT_MINUTES})"
    status "WAITING_QODO: ${pushed_ago}/${QODO_WAIT_MINUTES} min"
    exit 0
  fi

  if [ "$rounds" -ge "$MAX_REVIEW_ROUNDS" ]; then
    finish_blocked "$issue" "$pr" "the $MAX_REVIEW_ROUNDS-round review limit is used up and the reviewer is still talking. The open findings are yours."
  fi

  local round=$((rounds + 1))

  # Hand the agent the review and the diff as files. It has no `gh` and no
  # `git diff`: both can write through options that walk past a path denial.
  mkdir -p "$worktree/$IO_DIR"
  gh api "repos/$REPO_SLUG/issues/$pr/comments" --paginate \
    --jq '[.[] | select(.user.login == "qodo-code-review[bot]")
               | select(.body | startswith("<h3>Code Review by Qodo"))]
          | max_by(.updated_at) | .body' >"$worktree/$IO_DIR/review.html" 2>/dev/null
  git -C "$worktree" diff "$MAIN_SHA...HEAD" >"$worktree/$IO_DIR/diff.patch" 2>/dev/null
  gh pr view "$pr" --repo "$REPO_SLUG" --json body --jq .body >"$worktree/$IO_DIR/pr-body.md" 2>/dev/null
  rm -f "$worktree/$IO_DIR/verdict" "$worktree/$IO_DIR/round-comment.md"

  local prompt="$worktree/$IO_DIR/prompt.md"
  sed -e "s|{{ISSUE}}|$issue|g" -e "s|{{PR}}|$pr|g" -e "s|{{ROUND}}|$round|g" \
      -e "s|{{FIXES_USED}}|$fixes|g" -e "s|{{MAX_FIXES}}|$MAX_FIX_ROUNDS|g" \
      -e "s|{{REPO}}|$REPO_SLUG|g" -e "s|{{IO}}|$IO_DIR|g" \
      "$FACTORY_DIR/playbook-review.md" >"$prompt"

  run_agent "$worktree" "$prompt" "review-$round"
  local verdict; verdict="$(read_verdict "$worktree")"
  event "agent verdict: $verdict"

  local new_head; new_head="$(git -C "$worktree" rev-parse HEAD)"
  local changed=0; [ "$new_head" != "$head_sha" ] && changed=1

  case "$verdict" in
    BLOCKED*) finish_blocked "$issue" "$pr" "the agent stopped on its own — ${verdict#BLOCKED: }" ;;
    NO_FINDINGS|REJECTED_ALL|FIXED) : ;;
    *) finish_blocked "$issue" "$pr" "the agent returned no usable verdict (got '$verdict')" ;;
  esac

  # A FIXED that committed nothing is not a fix. Earlier this spent a round and
  # left the same review eligible forever.
  if [ "$verdict" = "FIXED" ] && [ "$changed" = "0" ]; then
    finish_blocked "$issue" "$pr" "the agent reported FIXED but committed nothing"
  fi
  if [ "$verdict" != "FIXED" ] && [ "$changed" = "1" ]; then
    finish_blocked "$issue" "$pr" "the agent reported $verdict but changed the branch; that combination is not reviewable"
  fi
  if [ "$verdict" = "FIXED" ] && [ "$fixes" -ge "$MAX_FIX_ROUNDS" ]; then
    finish_blocked "$issue" "$pr" "the $MAX_FIX_ROUNDS fix rounds are used up and findings are still open."
  fi

  # The runner posts the round comment and owns the marker.
  local fixes_this=0; [ "$verdict" = "FIXED" ] && fixes_this=1
  local comment="$worktree/$IO_DIR/round-comment.md"
  [ -s "$comment" ] || finish_blocked "$issue" "$pr" "the agent wrote no round comment, so its reasoning would not reach the pull request"

  if [ "$verdict" = "FIXED" ]; then
    run_checks "$worktree" || finish_blocked "$issue" "$pr" "the checks went red answering the review: $CHECK_FAILURE"
    # No "did main move" guard here, unlike the implement pass: this push goes
    # to the agent's own branch, which `main` moving does not endanger. Whether
    # a stale branch is still worth merging is the human's call at merge time.
    git -C "$worktree" push --quiet origin "HEAD:refs/heads/$branch" \
      || finish_blocked "$issue" "$pr" "pushing round $round failed"
    new_head="$(git -C "$worktree" rev-parse HEAD)"
    event "pushed round $round — back to waiting for the reviewer"
  fi

  { cat "$comment"
    printf '\n<!-- factory round=%s fixes=%s head=%s -->\n' "$round" "$fixes_this" "$head_sha"
  } | gh_write pr comment "$pr" --repo "$REPO_SLUG" --body-file -
  post_timeline "$pr" "Factory run $RUN_ID — review round $round"

  case "$verdict" in
    NO_FINDINGS)
      run_checks "$worktree" || finish_blocked "$issue" "$pr" "the review found nothing but the checks are red: $CHECK_FAILURE"
      finish_ready "$issue" "$pr" "The Qodo review of the current head commit has no open finding."
      ;;
    REJECTED_ALL)
      run_checks "$worktree" || finish_blocked "$issue" "$pr" "every finding was rejected but the checks are red: $CHECK_FAILURE"
      finish_ready "$issue" "$pr" "Every finding in round $round was rejected with a reason and nothing was changed; the reasons are in the round comment above for you to overrule."
      ;;
  esac

  status "ROUND: $round done on #$pr (verdict $verdict)"
}

# ---------------------------------------------------------------------------

main() {
  preflight
  local pr; pr="$(open_agent_pr)"
  if [ -n "$pr" ]; then review_pass "$pr"; else implement_pass; fi
}

main "$@"
