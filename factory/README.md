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
`<!-- factory round=K fixes=N -->` marker — so it survives a crash, a restart,
and the agent having no memory of earlier passes.

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

## Permissions

The agent runs with `--permission-prompts none`, so a tool it is not allowed
is refused outright rather than queued for a human who is not there. That was
measured before it was relied on: a denied `Bash` call comes back denied and
the pass carries on.

It may read and edit the working tree, run this project's checks, and read and
comment on GitHub. It cannot push, merge, rebase, reset, check out, branch,
close a pull request or an issue, run `firebase`, `gcloud` or `flutterfire`,
reach the network, or edit `assets/content/decks/`, `factory/`, `docs/`,
`.github/`, `.qodo/` or `.gitignore`.

**The deny list is the real boundary, not the allow list.** `--allowedTools` is
additive to whatever the host's own `~/.claude/settings.json` already permits,
and a headless run inherits that. Deny rules win over allow rules where they
overlap, so everything that must never happen is named explicitly rather than
merely left out.

That is why the interpreters are denied — `python`, `perl`, `ruby`, `node`,
`osascript`, and nested `sh`/`bash`/`zsh`. An agent that can run any of them
can do everything they can do, and the allow-list stops meaning what it says.
This is the exact finding Qodo raised against the reference implementation of
this pattern, whose first tool list permitted any `git` or `python` command.

Bare `flutter` and `dart` are denied too, which turns a house rule into a
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
factory/agent-run.sh --dry-run   # preflight, ticket pick, implement, checks — pushes nothing
factory/agent-run.sh             # one real pass
```

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
