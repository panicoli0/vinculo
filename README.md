# Vínculo

**A bilingual (ES/EN) iOS and Android app for building family bonds through questions —
and remembering what each person has already told to whom.**

Families lose their stories because nobody knows where to start, and because the
same story gets told three times to one grandchild and never to another. Vínculo
fixes the second half of that problem: each person uses **their own phone**,
remotely and asynchronously. One person asks a question, the other tells the
story — in writing, or by marking *"I told them on a call or in person"* plus a
short note — and the app keeps the **anti-repetition history**: what each teller
has already told, and to whom.

That history is the differentiator. The teller sees everything they have told
across all their bonds; a listener never sees anything from a bond they are not
part of.

Codename **Vínculo**; the store name is still open.

---

## Status

Pre-release, built in public during the
[Qodo "Build a Software Factory in 30 Days" hackathon](https://hackathon.qodo.ai/)
(November 2026).

| Phase | What it covers | State |
|---|---|---|
| 0 | Product spec, data model, analytics table, phase plans | ✅ approved |
| 1 | Flutter foundations, theme, i18n, router, flavors, Firebase projects, Functions skeleton | 🟨 one step left |
| 2 | Accounts, age gate, sign-in, family | 🟨 in progress |
| 3 | Bonds, questions and stories | ⬜ |
| 4 | AI question suggestions | ⬜ |
| 5 | Progress, streaks, reminders | ⬜ |
| 6 | Analytics, beta | ⬜ |

The product documentation (functional spec, PRD, data model, analytics event
table, per-phase plans) is kept in a private working set and is not published
here, so links to `docs/` from `CLAUDE.md` resolve only in the working tree.

---

## Stack

- **Flutter 3.44.0 / Dart 3.12.0**, pinned with [FVM](https://fvm.app) (`.fvmrc`).
- **Riverpod 3** for shared state, `freezed` + `json_serializable` for models,
  [slang](https://pub.dev/packages/slang) for i18n, GoRouter with a
  `StatefulShellRoute` bottom bar.
- **Firebase**: Auth, Firestore, Cloud Functions (TypeScript, Node 22), FCM,
  Analytics, Crashlytics, App Check, Hosting. Two projects, two flavors
  (`dev` / `prod`), on both platforms.
- No Firebase Dynamic Links (shut down August 2025): App Links / Universal
  Links over Firebase Hosting, with a typed fallback code.

### Architecture

Feature-first:

```
lib/
  app/                     MaterialApp.router, GoRouter, deep links
  core/                    theme, i18n, config, errors, analytics, firebase, widgets
  features/<feature>/
    domain/                pure Dart — no Flutter, no Firebase, no plugins
    data/                  Firestore / callable / InMemory implementations
    presentation/          screens, widgets, Riverpod providers
functions/                 Cloud Functions (TypeScript)
firestore.rules            security rules
hosting/public/            deep-link association files
```

Boundaries the code is held to:

- `presentation → domain ← data`. `domain/` imports no Flutter and no plugins.
- A feature imports only another feature's `domain/`. The single exception is
  provider composition in `presentation/*_providers.dart`.
- `core/` never imports `features/*/presentation/`.
- Repository providers are typed as the **interface** and throw
  `UnimplementedError` until `main.dart` overrides them — Firestore at runtime,
  `InMemory*` when `USE_FIREBASE=false`.
- **Firestore is the source of truth.** `shared_preferences` only holds
  device-level state (theme, locale before sign-in, analytics consent).
- Counters, invites, codes, minor profiles, AI calls and cascading deletes go
  **only through Cloud Functions**. The client never writes stats or consent.

---

## Running it

The app runs **with no Firebase at all** on the in-memory repositories, which is
the fastest way to see it:

```bash
cp env/example.json env/dev.json          # USE_FIREBASE is already false there
fvm flutter pub get
fvm flutter run --flavor dev --dart-define-from-file=env/dev.json
```

To run it against your own Firebase projects, set `USE_FIREBASE` to `true` in
`env/dev.json` and add the per-project configuration, which is **not published
in this repository**:

```bash
cp lib/core/firebase/firebase_options_dev.dart.example  lib/core/firebase/firebase_options_dev.dart
cp lib/core/firebase/firebase_options_prod.dart.example lib/core/firebase/firebase_options_prod.dart
# then fill them in, and drop your own files at:
#   android/app/src/{dev,prod}/google-services.json
#   ios/config/{dev,prod}/GoogleService-Info.plist
```

Both platforms **require** `--flavor`; a build without one fails on purpose,
rather than quietly producing a prod bundle id with no Firebase config.

### Day to day

```bash
fvm dart run slang                 # i18n — ALWAYS before build_runner
fvm dart run build_runner build    # freezed / json_serializable / riverpod (no -d)
fvm flutter analyze                # must end at "No issues found!"
fvm dart format .

cd functions && npm run build && npm run lint
firebase emulators:start --project dev
```

---

## Standards

[`AGENTS.md`](AGENTS.md) is the contract the coding agents and the AI reviewer
work under: setup and verification commands, five rules with the scope and the
reason for each, and the invariants that are easy to get wrong (two independent
language axes, per-bond formality, how the anti-repetition key is computed).
[`CLAUDE.md`](CLAUDE.md) is the deeper guide behind it.

Privacy is a hard constraint, not a preference. No names, birth years, story
text, user-written or AI-generated question text, invite codes or Firebase uids
ever reach an analytics event; the only identifiers are random references. No
IDFA, no advertising id, no ATT prompt. The AI function never receives notes,
answers, names or birth years.

There are no automated tests, by explicit product decision; each phase is
verified with a manual rules checklist in the Firebase emulator, static
analysis, and AI code review on every pull request.

## License

All rights reserved. Published for review during the Qodo hackathon.
