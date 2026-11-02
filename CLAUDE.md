# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

**Vínculo** (codename; Dart package `vinculo`, working bundle ID `com.innerchildstudios.vinculo`, store name still open) — a bilingual ES/EN iOS and Android app for creating or strengthening family bonds through questions. Each person uses their **own phone**, remotely and asynchronously. One person asks, the other tells the story (in writing, or by marking "I told them on a call or in person" plus a note), and the app remembers **what each teller already told to whom** — that anti-repetition history is the product's differentiator. Backend is Firebase (Auth, Firestore, Functions, FCM, Analytics, Crashlytics, App Check, Hosting).

It was born from a scope analysis of **Rootsy** (`/Users/pablonicoli/development/rootsy`). Rootsy is a separate product. **Never modify anything under `/Users/pablonicoli/development/rootsy`**: we copy and adapt its code, we do not depend on it.

Read in this order:
- [docs/plans/HANDOFF.md](docs/plans/HANDOFF.md) — current state, what comes next, open decisions. **Start there.**
- [docs/product_spec.md](docs/product_spec.md) — the authoritative functional spec (Spanish). **When it and the PRD disagree, the spec wins.**
- [docs/prd.md](docs/prd.md) — product intent and the four hypotheses H1–H4.
- [docs/data_model.md](docs/data_model.md) — Firestore collections, indexes, the security-rules matrix, the Cloud Functions catalog.
- [docs/analytics.md](docs/analytics.md) — the event table (frozen once approved).
- [docs/plans/](docs/plans/) — one plan per phase, each with concrete files and a coordinator brief.
- [BRIEF.md](BRIEF.md) — the original brief. Its §3 and §5 are closed decisions.
- [docs/design/rootsy-ux.jpeg](docs/design/rootsy-ux.jpeg) — the original mockup. Direction only, **not a spec**.

## Current state

Phase 0 (documentation) is written and **waiting for PO approval**. There is no Flutter project yet. Do not run `flutter create` or write app code until HANDOFF says Phase 0 is approved.

**There are no tests, by explicit PO decision** — not even Firestore rules tests. Do not add a `test/` directory, test dependencies or the rules emulator test harness, and do not re-raise the subject unless asked. Each phase plan has a manual "rules checklist" to walk through in the emulator instead.

## Commands (from Phase 1 on)

Flutter 3.44.0 / Dart 3.12.0 pinned via FVM (`.fvmrc`). **Always prefix with `fvm`.**

```bash
fvm flutter run --flavor dev --dart-define-from-file=env/dev.json   # copy env/example.json first
fvm dart run slang                     # i18n — ALWAYS before build_runner
fvm dart run build_runner build        # freezed / json_serializable / riverpod — no -d
fvm flutter analyze                    # must end at "No issues found!"
fvm dart format .

cd functions && npm run build && npm run lint      # Cloud Functions (TypeScript, Node 22)
firebase emulators:start --project dev
firebase deploy --only firestore:rules,firestore:indexes --project dev
```

`build_runner` 2.15.1 **removed `--delete-conflicting-outputs`** — do not pass `-d`.
`env/*.json` is gitignored except `env/example.json`. `USE_FIREBASE=false` runs the app on the `InMemory*` repositories with no Firebase at all.

## Architecture

Feature-first, inherited from Rootsy: `lib/features/<feature>/{domain,data,presentation}`, plus `lib/app/` (MaterialApp.router, GoRouter with a `StatefulShellRoute` bottom bar, deep links) and `lib/core/` (theme, i18n, config, errors, analytics, firebase, assets, shared widgets). Server code lives in `functions/` (TypeScript); rules in `firestore.rules`; deep-link files in `hosting/public/`.

The `agentic-flow:conventions-dart-flutter` skill describes a 6-layer `l1_domain … l6_ui` layout. **That layout does not apply here** — this file and the phase plans win. Everything else from that skill applies (Riverpod for shared state, `const`, strict typing, exhaustive `switch`, enums over loose constants, exact pubspec pins, doc comments on public API).

Non-negotiable boundaries:
- `presentation → domain ← data`. `domain/` imports no Flutter, no Firebase, no plugins.
- A feature imports only another feature's `domain/`. Exception inherited from Rootsy: provider composition in `presentation/*_providers.dart` may read another feature's providers. Never another feature's view models.
- `core/` must not import `features/*/presentation/`. `core/ → features/*/domain/` is allowed (`analytics_event.dart` is typed with domain enums).
- Repository providers are typed as the **interface** and throw `UnimplementedError` until `main.dart` overrides them. Firestore/callable implementations at runtime; `InMemory*` implementations when `USE_FIREBASE=false`.
- **Firestore is the source of truth.** `shared_preferences` only holds device-level state (theme, UI locale before sign-in, analytics consent, age-gate lock, milestones already celebrated).
- Counters (garden stage, streak, milestones, covered topics), invites, codes, custom tokens, minor profiles, AI and cascading deletes go **only through Cloud Functions**. The client never writes `stats`, `countedAt`, `consent` or family `memberUids` (except creating its own family).
- Widget-local state (controllers, animations) in `StatefulWidget`, not Riverpod.
- Identifiers, file names and doc comments in English; explanatory comments in Spanish (Rootsy convention).

## Things that are easy to get wrong

- Two independent language axes: **UI locale** (slang, es/en) and **card language mode** (english / spanish / bilingual). Never couple them. User-written questions stay in the language they were written in.
- **Formality is per bond**, not global: `bonds.addressFormality[uid]` is how questions *to* that uid are phrased. `CardText.resolve` falls back to `es` when `esUsted` is null or blank.
- `questionKey` is the anti-repetition key: `card:<cardId>` for curated cards **and for AI variations of a card** (`variationOf`); `text:<sha256(normalized text)>` for custom and new AI questions. Never compute it any other way.
- Privacy is per document: `users/{uid}` is owner-only (birth year, consent, prefs); what the family sees lives in `families/{id}/members/{uid}`. `asks`/`tellings` carry `memberUids`, `tellerUid`, `listenerUid` so collection-group queries can be authorized — keep them in sync on write.
- The teller sees whom they told what across **all** their bonds; a listener sees nothing from bonds they are not in.
- Analytics must be read **at log time** (`ref.read(analyticsServiceProvider).log(...)`), never captured into a field. It is off without consent **and always off for minor accounts**.
- After an `await` in a Riverpod 3 notifier, check `ref.mounted` before touching `state`.
- `freezed` is pinned to `4.0.0-dev.3` deliberately. Do not "upgrade" it. `Override` comes from `riverpod_annotation`; `.select` from `flutter_riverpod`.
- `AppThemeExtension` needs `==`/`hashCode` over every field, or `AnimatedTheme` animates on every rebuild. Nunito is a variable font: set `fontVariations` **and** `fontWeight`.
- `TextScaler.scale(x)` is nonlinear on Android 14+; never use it to size layout. See `docs/kb/fragilities/`.
- No Firebase Dynamic Links (shut down August 2025): App Links / Universal Links over Firebase Hosting, plus a typed fallback code.
- Minor codes are single-use, expire in 24 h and are stored only as an HMAC; under-13 profiles stay disabled server-side (`UNDER13_PROFILES_ENABLED=false`) until legal defines the parental verification method.

## Content invariants

`assets/content/decks/vinculo.json` is product-owned content seeded from Rootsy's `raices.json` (spec §7). **Never edit card text, reformat the file, or "improve" it.** `DeckValidator` enforces the invariants at startup: debug shows the problem list, release drops invalid cards and reports. Topics per intent come from the same file; Cloud Functions read a copy made by `functions/scripts/sync-content.mjs` at build time — never hand-edit the copy.

## Analytics and privacy

`AnalyticsService.log(AnalyticsEvent)` over a sealed event class. The event/parameter table in [docs/analytics.md](docs/analytics.md) is the MVP's measurement instrument; once the PO approves it, it is **frozen**: do not rename, add or drop an event or parameter. Never put names, birth years, note/answer text, user-written or AI question text, invite codes or Firebase uids in an event; the only ids are the random `family_ref` / `bond_ref` / `invite_ref`. No IDFA, no AdSupport, no ATT prompt, no advertising ID. The AI Cloud Function never receives notes, answers, names or birth years, and its API key never ships in the app.

## Scope discipline

v1 is the beta in [docs/product_spec.md](docs/product_spec.md). Deferred to v1.1: audio and photos, non-family bonds, real IAP billing. Never built: numeric bond score, audio transcription, adult-created passwords sent by chat, web. Also not in v1 unless asked: pending-invite management, removing members, leaving a family without deleting the account, deleting a single bond, exporting stories, translating user-written questions.
