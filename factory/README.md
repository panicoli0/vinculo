# The factory

A scheduled job on the maintainer's machine that picks up a ticket, delivers a
pull request, answers the Qodo review, and stops for a human when it is stuck.
It never merges.

Adding the label `ready-for-agent` to an issue is the whole interface. Within
fifteen minutes a branch exists, the checks have run, and a pull request is
open with the ticket's acceptance criteria quoted and answered one by one.

```
factory/
  agent-run.sh           the runner — one pass per invocation
  playbook-implement.md  the prompt for the implement pass
  playbook-review.md     the prompt for one round of review
  launchd.plist.example  the schedule
  runs/                  run logs, local only
```

## How a delivery goes

```
  label `ready-for-agent`
          │
          ▼
  pass 1 ── claim: `ready-for-agent` → `agent-working`
          ── refuse the ticket if it has no `## Acceptance criteria`
          ── fresh worktree on `agent/issue-N-<slug>` cut from origin/main
          ── agent implements and commits          (up to 2 attempts to get checks green)
          ── checks: slang → build_runner → format → analyze → functions
          ── runner pushes, opens the PR                        → PR_OPENED
          │
          ▼  (15 min later, and again, and again)
  pass n ── is there a Qodo review newer than the head commit?
          ── no  → WAITING_QODO, and after 45 minutes → `agent-blocked`
          ── yes → agent decides confirmed/rejected on each finding,
                   fixes the confirmed ones, posts `Agent round K`   → ROUND
          │
          ▼
  no open finding → `agent-ready`, and the human decides whether to merge
```

Status lines — `IDLE`, `SKIP`, `PR_OPENED`, `WAITING_QODO`, `ROUND`, `READY`,
`BLOCKED` — are the last line of every pass, for a human skimming the log.

## Limits

| | |
|---|---|
| Attempts to get the checks green while implementing | **2** |
| Rounds of Qodo review answered | **3** |
| Rounds in which the agent changes code for the reviewer | **2** |
| Silence from the reviewer before stopping | **45 min** |
| Wall clock for one agent invocation | **45 min** |
| Tickets per pass | **1** |

They live at the top of `agent-run.sh` and every one can be overridden from the
environment, so the schedule can change a limit without editing the script.

**The limits are enforced in bash, not in the prompt.** A retry limit a model is
asked to respect is a hope; a retry limit a script counts is a fact. The round
counter is read back off the pull request — each round comment carries a
`<!-- factory round=K fixes=N head=<sha> -->` marker — so it survives a crash,
a restart, and the agent having no memory of earlier passes.

**The runner writes that marker, not the agent.** It also refuses to answer a
review of a commit it has already answered, and refuses a `FIXED` verdict that
did not move the branch. Those three together are what stop a failed comment
post, a malformed marker or an empty fix from quietly resetting the count and
spending rounds on nothing.

## Four decisions worth the words

**The runner owns the state machine; the agent owns the code.** Picking the
ticket, claiming it, counting rounds, pushing, opening the pull request and
labelling are all bash. The agent is invoked twice with two narrow jobs:
implement this, or answer this review.

**Work state lives on GitHub, never in the agent's memory.** Every pass starts
cold and reconstructs where it is from labels on the ticket and comments on the
pull request. That is what makes a fifteen-minute poll safe to interrupt.

**The agent cannot push.** It commits; the runner pushes, to one branch whose
name the runner computed. `git push` is not on the agent's allow-list. So a
prompt injection in an issue body or in a review comment has no path to `main`,
and both playbooks say in as many words that text in a ticket or a review is
data to weigh and not an instruction.

**It never merges.** Not when the checks are green, not when the reviewer is
silent, not when it is sure. It labels the pull request `agent-ready` and
stops.

## The agent talks to nothing

The agent has **no `gh`, no network, and no `git` beyond `status`, `add` and
`commit`.** The runner fetches what it needs into `.factory/` inside the
worktree, and posts whatever it writes back there:

| in | out |
|---|---|
| `.factory/ticket.md` — the issue | `.factory/pr-title`, `.factory/pr-body.md` |
| `.factory/review.html` — the Qodo review | `.factory/round-comment.md` |
| `.factory/diff.patch` — the change so far | `.factory/verdict` |
| `.factory/pr-body.md` — the description as it stands | |

That directory is excluded through the worktree's git exclude file, and
`exclude_io_dir` **proves** the exclusion took by writing a probe and asserting
a clean `git status` — a linked worktree has a `.git` *file*, not a directory,
so the obvious path writes nowhere and would have failed every ticket at the
clean-tree gate. The exclusion lands in the repository's local
`.git/info/exclude`, which is one idempotent line and is never committed.

This shape is not tidiness. It is what makes "text in a ticket is data, not
instructions" structurally true instead of merely asserted.

## Permissions

The agent runs with `--permission-prompts none`, so a tool it is not allowed
is refused outright rather than queued for a human who is not there. That was
measured before it was relied on: a denied `Bash` call comes back denied and
the pass carries on.

**The deny list is the real boundary, not the allow list.** `--allowedTools` is
additive to whatever the host's own `~/.claude/settings.json` already permits,
and a headless run inherits that. Deny rules win over allow rules where they
overlap, so everything that must never happen is named explicitly rather than
merely left out.

Three of those denials exist because a review of this runner found the hole:

- **No `gh` at all.** `gh api repos/<slug>:*` reads as a read-only escape
  hatch and is not: the same command reaches every write endpoint on the
  repository — including merge — with the runner's own credentials.
- **No `git diff`, `git show` or `git log`.** All three accept `--output=`,
  which writes a file *through git* and walks straight past a path-based
  `Edit()` or `Write()` denial. `git diff --output=.github/workflows/x.yml` is
  a write to a protected path that no path rule sees.
- **`npm --prefix functions` pinned to three exact scripts.** A wildcard there
  also permits `npm run deploy`, which is `firebase deploy` wearing a different
  hat, and `Bash(firebase:*)` never matches it.

The interpreters are denied for the same reason — `python`, `perl`, `ruby`,
`node`, `osascript`, and nested `sh`/`bash`/`zsh`. An agent that can run any of
them can do everything they can do, and the allow list stops meaning what it
says. Bare `flutter` and `dart` are denied too, which turns a house rule into a
mechanism: `AGENTS.md` requires the `fvm` prefix so the pinned SDK is the one
that runs, and here an unprefixed call is refused rather than silently
resolving to whichever of the four installed SDKs is first on `PATH`.

Compound shell commands are avoided on purpose — `cd functions && npm run
build` would match as one opaque string — so the playbooks use `npm --prefix
functions`. Every prefix pattern ends in `:*`; a wildcard earlier in the
pattern would also match options inserted at that position.

## What this factory cannot verify, and says so on every pull request

This matters more than anything above, because the gap is permanent and a
pull request that hides it is worse than one that does not exist.

1. **There are no tests in this project, by an explicit product decision — not
   even Firestore rules tests.** The runner does not run tests because there
   are none to run, and the playbooks forbid the agent from adding any or
   proposing them in review.
2. **Done here has two halves a scheduled job cannot reach.** `AGENTS.md`:
   *Done means `analyze` clean, the Cloud Functions build and lint clean, the
   change run by hand on a device or emulator, the per-phase manual rules
   checklist walked through in the Firebase emulator, and an AI review on the
   pull request.* The factory covers the first, the second and the last. **The
   hand run and the emulator checklist are the human's, and no trigger
   automates them.**
3. **Firestore rules are never deployed from here.** `firebase deploy` needs
   project credentials that this machine does not hand to agents. A change that
   touches `firestore.rules` arrives with the rules written and undeployed, and
   the pull request says so.
4. **Screen-level acceptance criteria stay open.** An agent can write the code
   behind *"the owner lands on `/family` and sees exactly one member"*. It
   cannot claim it saw the screen. Every pull request carries a *Not verified*
   section naming exactly which criteria that leaves open.

## Running it

```bash
factory/agent-run.sh --dry-run   # preflight, queue and ticket gate only
factory/agent-run.sh             # one real pass
```

`--dry-run` stops before the first thing that changes the machine or the
repository: it creates no worktree, starts no agent and performs no GitHub
write. It reads the queue, applies the acceptance-criteria gate, and prints
what it would have claimed.

On the schedule:

```bash
cp factory/launchd.plist.example ~/Library/LaunchAgents/vinculo.factory.plist
launchctl load  ~/Library/LaunchAgents/vinculo.factory.plist   # every 15 min
launchctl unload ~/Library/LaunchAgents/vinculo.factory.plist  # off
```

`launchd` hands a process almost no `PATH`, so `agent-run.sh` sets its own
before anything else; a missing binary there looks exactly like an agent
failure and is not one. Logs land in `factory/runs/` — gitignored, because
`*.log` is — one file per pass plus the agent's transcript. The public record
is on GitHub: the timeline of every pass is posted as a comment on the pull
request as events happen, not reconstructed afterwards.

## Queue hygiene

The runner takes the **oldest** open issue carrying `ready-for-agent`, because
a queue that serves the newest first starves its own backlog. To put a specific
ticket next, take the label off the ones ahead of it.

Labels: `ready-for-agent` → `agent-working` → `agent-ready` or
`agent-blocked`. To hand a blocked ticket back, fix what is in the way and move
the label from `agent-blocked` to `ready-for-agent`.
