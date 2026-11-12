#!/usr/bin/env bash
#
# Vínculo factory — propose house rules from the reviewer's own findings.
#
# Run it and it reads every Qodo finding this repository has ever received,
# groups the repeats, applies a threshold, and opens one proposal issue per
# pattern that clears it. It never edits `AGENTS.md`. A human approves a
# proposal by putting `ready-for-agent` on the issue, and the delivery runner
# writes the rule like any other ticket.
#
# Why this exists at all, and why it is a script rather than a sentence:
#
#   A process rule cannot be checked from a diff. "A finding seen twice should
#   become a rule" is a fine intention and nothing enforces it; the same
#   sentence as a script either opens an issue or it does not.
#
# Three decisions carry the weight, and two are inherited from `agent-run.sh`:
#
#   1. **The threshold is counted in bash, not asked of a model.** Same reason
#      the retry limits are: a number a script counts is a fact.
#   2. **The grouping is done by a model, not by keyword matching.** The
#      reviewer words the same defect differently every time — "Long emoji
#      names silently disable create" and "Family names over 40 emoji graphemes
#      fail to save" are one bug and share no distinctive words.
#   3. **A proposal is a ticket, not a commit.** Nothing here writes a rule.
#
# Usage:
#   factory/mine-rules.sh            collect, group, apply the threshold, open issues
#   factory/mine-rules.sh --dry-run  everything except opening the issues
#
set -uo pipefail

export PATH="${FACTORY_PATH_PREFIX:-$HOME/.local/bin:/opt/homebrew/bin:$HOME/.nvm/versions/node/v24.11.1/bin}:/usr/bin:/bin:/usr/sbin:/sbin"

REPO_SLUG="${FACTORY_REPO:-panicoli0/vinculo}"
REPO_DIR="${FACTORY_REPO_DIR:-$HOME/development/vinculo}"
WORK="${FACTORY_MINE_DIR:-$HOME/development/vinculo-factory/mine}"
FACTORY_DIR="$REPO_DIR/factory"
RUN_LOG_DIR="$FACTORY_DIR/runs"

# The threshold. Both halves matter, and the second is the one that earns its
# keep: without it the biggest cluster in this repository's history would fire,
# and that cluster is seventeen findings from one review of one script. That is
# one bad file, not a pattern in how the work is done.
MIN_FINDINGS="${FACTORY_RULE_MIN_FINDINGS:-3}"
MIN_TICKETS="${FACTORY_RULE_MIN_TICKETS:-2}"

REVIEWER="qodo-code-review[bot]"
LABEL_PROPOSAL="rule-proposal"
AGENT_TIMEOUT_SECONDS="${FACTORY_MINE_TIMEOUT:-1800}"

DRY_RUN=0
REUSE=0
case "${1:-}" in
  --dry-run) DRY_RUN=1 ;;
  # Grouping costs a model call over the whole corpus, and it is not
  # deterministic. `--reuse` judges and proposes from the last grouping instead
  # of paying for a second one that might disagree with the one just reviewed.
  --reuse)   REUSE=1 ;;
esac

mkdir -p "$RUN_LOG_DIR" "$WORK"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
RUN_LOG="$RUN_LOG_DIR/$RUN_ID.mine.log"

log() { printf '%s  %s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$*" | tee -a "$RUN_LOG"; }
status() { printf '%s\n' "$*" | tee -a "$RUN_LOG"; }

# The miner reads and writes files and nothing else. It has no shell at all:
# the corpus is collected before it starts and the issues are opened after it
# stops, so there is no command for it to need.
ALLOWED_TOOLS=(Read Write Glob Grep)
DENIED_TOOLS=(
  Bash WebFetch WebSearch TodoWrite
  "Edit(//$REPO_DIR/**)" "Read(//$HOME/.ssh/**)" "Read(//$HOME/.aws/**)"
  "Read(//$HOME/.claude/**)" "Read(//$HOME/.config/**)" "Read(//$HOME/.gnupg/**)"
)

# ---------------------------------------------------------------------------
# 1. Collect every finding the reviewer has ever left, as a readable corpus.
#
# Qodo *edits its summary comment in place*, so the body of the "Code Review by
# Qodo" comment on every pull request here now reads `Bugs (0)` — including the
# one that had seventeen. The durable record is the inline comments, and this
# is the only reason the history is still minable at all.
# ---------------------------------------------------------------------------
collect() {
  local corpus="$WORK/findings.md" prs n count total=0 tickets=0
  : >"$corpus"
  prs="$(gh pr list --repo "$REPO_SLUG" --state all --limit 200 --json number --jq '.[].number' | sort -n)"
  for n in $prs; do
    count="$(gh api "repos/$REPO_SLUG/pulls/$n/comments" --paginate \
      --jq "[.[] | select(.user.login == \"$REVIEWER\")] | length" 2>/dev/null || echo 0)"
    [ "${count:-0}" -eq 0 ] && continue
    tickets=$((tickets + 1)); total=$((total + count))
    printf '\n\n## Pull request #%s — %s finding(s)\n' "$n" "$count" >>"$corpus"
    gh api "repos/$REPO_SLUG/pulls/$n/comments" --paginate \
      --jq ".[] | select(.user.login == \"$REVIEWER\")
            | \"\n### [PR#$n] \(.path)\n<!-- id=\(.id) pr=$n -->\n\(.body)\n\"" >>"$corpus" 2>/dev/null
    log "collected $count finding(s) from PR #$n"
  done
  # The HTML is the reviewer's badge markup; it carries no information the
  # model needs and a lot of tokens it would pay for.
  sed -i '' -E 's/<img[^>]*>//g; s/<\/?(h3|b|i|pre|code|details|summary|table|tr|td|th|br|p|div|span|a)[^>]*>//g' "$corpus"
  log "corpus: $total finding(s) across $tickets pull request(s) → ${corpus}"
  CORPUS_TOTAL="$total"; CORPUS_TICKETS="$tickets"
}

# ---------------------------------------------------------------------------
# 2. Group the repeats. A model does this, because the reviewer renames the
#    same defect every time it meets it.
# ---------------------------------------------------------------------------
group() {
  local prompt="$WORK/prompt.md" out="$RUN_LOG_DIR/$RUN_ID.mine.agent.log"
  cp "$REPO_DIR/AGENTS.md" "$WORK/AGENTS.md"
  sed -e "s|{{MIN_FINDINGS}}|$MIN_FINDINGS|g" -e "s|{{MIN_TICKETS}}|$MIN_TICKETS|g" \
      "$FACTORY_DIR/playbook-mine.md" >"$prompt"
  rm -f "$WORK/groups.json"

  log "grouping (timeout ${AGENT_TIMEOUT_SECONDS}s)"
  set -m
  ( cd "$WORK" && claude -p "$(cat "$prompt")" \
      --permission-mode acceptEdits --permission-prompts none --output-format text \
      --allowedTools "${ALLOWED_TOOLS[@]}" --disallowedTools "${DENIED_TOOLS[@]}" ) >"$out" 2>&1 &
  local pid=$!
  set +m
  ( sleep "$AGENT_TIMEOUT_SECONDS"; kill -TERM -"$pid" 2>/dev/null || kill -TERM "$pid" 2>/dev/null ) &
  local killer=$!
  wait "$pid"; local rc=$?
  kill "$killer" 2>/dev/null; wait "$killer" 2>/dev/null

  [ -s "$WORK/groups.json" ] || { status "FAILED: the miner wrote no groups.json (rc=$rc, see ${out##*/})"; exit 1; }
  jq empty "$WORK/groups.json" 2>/dev/null || { status "FAILED: groups.json is not valid JSON"; exit 1; }
  log "miner returned $(jq 'length' "$WORK/groups.json") group(s)"
}

# ---------------------------------------------------------------------------
# 3. Apply the threshold here, in bash, over the model's grouping.
#
# The model says which findings belong together; it does not get to say whether
# that is enough to propose a rule. Distinct pull requests are counted from the
# findings themselves rather than taken from a field the model filled in.
# ---------------------------------------------------------------------------
judge() {
  jq --argjson minf "$MIN_FINDINGS" --argjson mint "$MIN_TICKETS" '
    [ .[]
      | . + { finding_count: (.findings | length),
              ticket_count:  (.findings | map(.pr) | unique | length) }
      | . + { fires: (.finding_count >= $minf and .ticket_count >= $mint) }
    ] | sort_by(-.finding_count)
  ' "$WORK/groups.json" >"$WORK/judged.json"

  printf '\n  %-52s %5s %5s  %s\n' "PATTERN" "FIND" "PRS" "VERDICT" | tee -a "$RUN_LOG"
  jq -r --argjson minf "$MIN_FINDINGS" --argjson mint "$MIN_TICKETS" '.[] |
    "  \(.name[0:52] | . + (" " * (52 - length)))  \(.finding_count|tostring|(" "*(4-length))+.)  \(.ticket_count|tostring|(" "*(4-length))+.)  " +
    (if .fires then (if (.covered_by // "") != "" then "covered already by \(.covered_by)" else "PROPOSE" end)
     else "below threshold" end)' "$WORK/judged.json" | tee -a "$RUN_LOG"
  echo | tee -a "$RUN_LOG"
}

# ---------------------------------------------------------------------------
# 4. Open one proposal issue per pattern that clears the threshold and is not
#    already covered by a rule. The issue carries acceptance criteria because
#    the delivery runner refuses a ticket without them.
# ---------------------------------------------------------------------------
propose() {
  local n=0
  while read -r idx; do
    local g name statement scope why body title
    g="$(jq -c ".[$idx]" "$WORK/judged.json")"
    name="$(jq -r '.name' <<<"$g")"
    statement="$(jq -r '.statement' <<<"$g")"
    scope="$(jq -r '.scope' <<<"$g")"
    why="$(jq -r '.why' <<<"$g")"
    title="rule proposal: $name"

    body="$WORK/proposal-$idx.md"
    {
      printf '## The pattern\n\n%s\n\n' "$statement"
      printf '**Where it applies:** %s\n\n**Why it matters:** %s\n\n' "$scope" "$why"
      printf '## Evidence — %s findings across %s pull requests\n\n' \
        "$(jq -r '.finding_count' <<<"$g")" "$(jq -r '.ticket_count' <<<"$g")"
      jq -r '.findings[] | "- **[PR #\(.pr)]** \(.title)\n  `\(.path)` — \(.what)"' <<<"$g"
      printf '\n\n> Threshold: a pattern is proposed at **%s findings across at least %s pull requests**.\n' \
        "$MIN_FINDINGS" "$MIN_TICKETS"
      printf '> Counted by `factory/mine-rules.sh`, not by the model that grouped them.\n\n'
      printf '## Proposed wording\n\n```markdown\n%s\n```\n\n' "$(jq -r '.proposed_rule' <<<"$g")"
      printf '## Acceptance criteria\n\n'
      printf '1. `AGENTS.md` carries the rule above, in this project'"'"'s *Where / Rule / Why* shape, either as a new numbered rule or as a refinement of the existing rule it belongs with.\n'
      printf '2. The rule names a **measurable** condition. A reader can tell from the text whether a given diff satisfies it, without asking anyone.\n'
      printf '3. Every finding listed under *Evidence* would have been prevented, or caught, by the rule as written. If one would not, the rule is wrong and says so instead.\n'
      printf '4. No existing rule is contradicted or duplicated. If the rule belongs inside an existing one, it goes there and the existing one is edited.\n'
      printf '5. `fvm flutter analyze` ends at `No issues found!` — this change is documentation, so nothing else should move.\n\n'
      printf '### Out of scope\n\n'
      printf -- '- Changing any code to comply. The rule describes what is already expected; code that breaks it is a separate ticket.\n'
      printf -- '- Importing the rule into the Qodo portal. That is the human'"'"'s step and the import rewrites what it is given.\n\n'
      printf -- '---\n\n*Proposed automatically by `factory/mine-rules.sh` (run `%s`) from this repository'"'"'s own review history. Nothing was written to `AGENTS.md`. To accept, add `ready-for-agent` and the delivery runner will draft it.*\n' "$RUN_ID"
    } >"$body"

    if [ "$DRY_RUN" = "1" ]; then
      log "dry-run: would open \"$title\" (body at ${body})"
    else
      local url
      url="$(gh issue create --repo "$REPO_SLUG" --title "$title" \
             --label "$LABEL_PROPOSAL" --body-file "$body" 2>>"$RUN_LOG")"
      log "opened $url"
    fi
    n=$((n + 1))
  done < <(jq -r 'to_entries[] | select(.value.fires and ((.value.covered_by // "") == "")) | .key' "$WORK/judged.json")

  PROPOSED="$n"
}

main() {
  command -v gh >/dev/null && command -v jq >/dev/null && command -v claude >/dev/null \
    || { status "SKIP: gh, jq and claude must all be on PATH"; exit 0; }
  gh auth status >/dev/null 2>&1 || { status "SKIP: gh is not authenticated"; exit 0; }

  log "mine run $RUN_ID · threshold ${MIN_FINDINGS} findings across ${MIN_TICKETS}+ PRs"
  if [ "$REUSE" = "1" ]; then
    [ -s "$WORK/groups.json" ] || { status "FAILED: --reuse needs a previous grouping at $WORK/groups.json"; exit 1; }
    log "reusing the grouping already in ${WORK}/groups.json"
  else
    collect
    [ "${CORPUS_TOTAL:-0}" -ge "$MIN_FINDINGS" ] || { status "IDLE: only ${CORPUS_TOTAL:-0} finding(s) on record"; exit 0; }
    group
  fi
  judge
  propose
  status "PROPOSED: $PROPOSED pattern(s) cleared ${MIN_FINDINGS}/${MIN_TICKETS} and were not already covered"
}

main "$@"
