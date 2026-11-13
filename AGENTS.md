# Vínculo

A bilingual (ES/EN) iOS and Android app for building family bonds through questions.
Each person uses **their own phone**, remotely and asynchronously: one asks, the other
tells the story — in writing, or by marking *"I told them on a call or in person"* plus
a note. The app keeps the **anti-repetition history**: what each teller has already
told, and to whom. That history is the product, not a feature of it.

Flutter 3.44.0 / Dart 3.12.0 (pinned with FVM), Riverpod 3, freezed, slang, GoRouter.
Firebase for Auth, Firestore, Cloud Functions (TypeScript, Node 22), FCM, App Check and
Hosting, across two projects and two flavors (`dev` / `prod`).

## Setup and verification

```bash
cp env/example.json env/dev.json     # USE_FIREBASE is false there: runs with no Firebase at all
fvm flutter pub get
fvm flutter run --flavor dev --dart-define-from-file=env/dev.json

fvm dart run slang                   # i18n — ALWAYS before build_runner
fvm dart run build_runner build      # freezed / json_serializable / riverpod. No -d: 2.15.1 removed it
fvm dart format .
fvm flutter analyze                  # done means this ends at "No issues found!"
                                     # run build_runner FIRST: analyze reads the generated
                                     # files, so a stale one is an error, not silence

cd functions && npm run build && npm run lint
firebase emulators:start --project dev
```

Always prefix Flutter and Dart with `fvm`. Both platforms require `--flavor`; a build
without one fails on purpose rather than quietly producing a prod bundle id.

**There are no automated tests, by an explicit product decision — not even Firestore
rules tests.** Do not add a `test/` directory, test dependencies or the rules emulator
test harness, and do not propose them in review. Done means: `analyze` clean, the
Cloud Functions build and lint clean, the change run by hand on a device or emulator,
the per-phase manual rules checklist walked through in the Firebase emulator, and an
AI review on the pull request.

## Picking up work

- The backlog is one plan per phase in `docs/plans/`, and `docs/plans/HANDOFF.md` says
  what is done, what is next and which decisions are still open. Read HANDOFF first.
- `docs/` is **not published in this repository** — it is a private working set, so
  those paths resolve in a working tree and not on GitHub. Everything an agent or a
  reviewer must enforce is in this file.
- One capability per branch, one pull request each. The pull request says what was
  verified and how, and what was deliberately left out.
- A decision listed as open in HANDOFF §4 is not yours to settle. Ask.

## Rules

### 1. Nothing that identifies a person leaves the phone

**Where:** every `AnalyticsService.log` call site, `lib/core/analytics/`, and the
arguments of the AI Cloud Function.
**Rule:** an analytics event may carry the random pseudonyms `family_ref`, `bond_ref`
and `invite_ref`, and nothing else that points at a person. Never a name, a birth year,
a note, an answer, a user-written or AI-generated question, an invite code, a Firestore
document id or a Firebase uid. The event table is **frozen**: do not rename, add or
drop an event or a parameter. Analytics is off without consent and always off for minor
accounts. Read the service at log time (`ref.read(analyticsServiceProvider).log(...)`),
never capture it into a field. No IDFA, no advertising id, no ATT prompt. The AI
function never receives notes, answers, names or birth years, and its API key never
ships in the app.
**Why:** the app holds family stories and the accounts of minors. An event that has
shipped cannot be recalled, and a name inside one is a leak with no undo. The frozen
table is the measurement instrument for the beta's four hypotheses: renaming a
parameter silently invalidates the numbers it was supposed to produce.

### 2. An empty cache is not an absence

**Where:** any Firestore read whose empty or missing result drives navigation, a gate,
or the decision to create something. Today `watchUser` and `watchFamilies`.
**Rule:** subscribe with `snapshots(includeMetadataChanges: true)` and treat
"empty or missing **and** `metadata.isFromCache`" as `AppFailure.network`, never as
proof that the thing does not exist. Only the server can assert an absence. Keep the
stream open so a later server snapshot replaces the error, and give the provider a
retry policy — after a listen error Firestore sends no further events, so a query with
no retry stays dead until the app restarts.
**Why:** offline with a cold cache, Firestore answers a query with zero documents. Read
as "this person has no family", that sends an existing member to the create-family
screen, and creating there writes a **second** family over the one they already have.
There is no undo for that in the product.

### 3. The client never writes what the server owns

**Where:** every Firestore write, and `firestore.rules`.
**Rule:** counters (garden stage, streak, milestones, covered topics), `stats`,
`countedAt`, `consent`, invites, codes, custom tokens, minor profiles, AI calls and
cascading deletes go **only** through Cloud Functions. The client writes
`families.memberUids` exactly once — creating its own family, with itself as the only
member. Every client write is a closed key map that mirrors a rule, so the client never
sends a write the rules would reject. A feature's rules ship in the same pull request
as the feature.
**Why:** rules are the only thing standing between one family's stories and another's;
a field the client can write is a field an attacker can write. Shipping a read the
rules deny does not leave the feature "unverified" — it locks every user out of the
app, which is exactly what happened on day one.

### 4. Layers do not leak

**Where:** every file under `lib/`.
**Rule:** `presentation → domain ← data`. `domain/` imports no Flutter, no Firebase and
no plugins. A feature imports only another feature's `domain/`; the single exception is
provider composition inside `presentation/*_providers.dart`, never another feature's
view models or screens. `core/` must not import `features/*/presentation/`. Repository
providers are typed as the **interface** and throw `UnimplementedError` until
`main.dart` overrides them — Firestore or callable implementations at runtime, the
`InMemory*` doubles when `USE_FIREBASE=false`. Widget-local state (controllers,
animations) lives in a `StatefulWidget`, not in Riverpod. Generated `.g.dart` and
`.freezed.dart` files are committed and must match their source **in the same commit**:
run `slang` and `build_runner` before `analyze`, never after. Generated files are not
excluded from analysis, and nothing may re-exclude them.
**Why:** `USE_FIREBASE=false` has to keep working with no Firebase at all — it is how
the app is run and demonstrated without credentials, and the first thing that breaks it
is a domain file that imports a plugin. Interface-typed providers are what make that
swap a one-line override instead of a refactor. The clause about generated files is not
hygiene: while they were excluded, a `.g.dart` calling a function its source had already
deleted reached `main`, the project did not compile, and `analyze` kept answering
"No issues found!".

### 5. The two language axes never couple, and formality is per bond

**Where:** anything reading a locale, rendering card text, or phrasing a question.
**Rule:** the **UI locale** (slang, `es`/`en`) and the **card language mode**
(`english` / `spanish` / `bilingual`) are independent. Never derive one from the other,
never offer one as a default for the other. Formality lives in
`bonds.addressFormality[uid]` and describes how questions *to that uid* are phrased, not
how that person speaks. `CardText.resolve` falls back to `es` when `esUsted` is null or
blank. A question somebody wrote stays in the language they wrote it in; it is never
translated.
**Why:** the family this app is for is exactly the one where the axes differ — a
grandmother reading the interface in Spanish, asking her grandchild questions in
English, addressing her brother as *tú* and her father-in-law as *usted*. Coupling the
axes makes the bilingual family, which is the whole point, unusable.

*There is no rule 6 on purpose: the number is reserved for `questionKey`, which becomes
rule 6 when phase 3 lands (see Project notes).*

### 7. A text limit is one number, on one value, in one unit per layer

**Where:** every length-bounded string a person types — today the family name
(`families.name`) and the display name (`users/{uid}` and
`families/{fid}/members/{uid}`) — at each place it is checked or written: the field's
`LengthLimitingTextInputFormatter` in `presentation/`, its policy in
`features/*/domain/` (`family_name_policy.dart`, `display_name_policy.dart`), the
repository methods that write it in **both** implementations in `features/*/data/`
(Firestore and `InMemory*`), and every `size()` bound on it in `firestore.rules`.
**Rule:** the policy in `domain/` is the single definition of the limit, as two named
constants in two named units: a product limit in grapheme clusters (`k…MaxLength`,
counted with `.characters.length`) and a storage bound in UTF-16 code units
(`k…MaxUtf16Units`, counted with `String.length`, the unit `size()` counts in the
rules). A count compared against the other unit's constant is a violation. The policy
checks both, so nothing it accepts can be rejected by a rule; the converse is expected,
because the rules cannot count graphemes and the storage bound is the looser of the
two. The storage bound is the literal in every `size()` that mirrors it, each such bound
has a comment naming the policy function it mirrors (or pointing at the bound that
does), and it admits a name made entirely of emoji: at least 15 UTF-16 units per
grapheme — a kiss with two skin tones, the longest RGI emoji sequence measured — so
640 ≥ 40 × 15 today. The formatter takes the grapheme constant and nothing else;
combining marks can still carry a value past the UTF-16 bound inside the grapheme
limit, so a non-empty field whose value the policy rejects says why on screen, and a
disabled button never stands alone. The value written is the value measured: the policy
measures the trimmed string, the caller passes that trimmed string and never the raw
field text, and the repository writes its argument verbatim. Both implementations check
that argument before writing — the policy plus its raw `String.length` against the
storage bound, the same expression in each — so the `InMemory*` double never stores
what the Firestore rule would refuse. Changing either number changes the policy, the
formatter and every mirroring `size()` in the same pull request. Rule 3 decides which
keys a write carries; this rule decides how a value in it is measured and which form of
it is sent. A blank name is rejected by the client only; whether the rules should reject
it too is open decision #17 in HANDOFF §4.
**Why:** each layer measuring length its own way has failed three times in two pull
requests, every time as a name a person could type but not save. The formatter counted
graphemes and the policy UTF-16 units, so an emoji family name left Create disabled
with no explanation (PR #1). The policy then moved to graphemes while the rule stayed
at 160 units, so a 40-emoji family name the app accepted was rejected by Firestore
(PR #8): the first fix landed in one layer and left the next behind. A display name was
validated trimmed and written raw, so Firestore rejected what the policy passed while
the in-memory double stored it — and `USE_FIREBASE=false` demonstrated behaviour the
real app does not have (PR #8).

## Project notes

- **`questionKey` is the anti-repetition key.** `card:<cardId>` for curated cards **and
  for AI variations of a card** (`variationOf`); `text:<sha256(normalized text)>` for
  custom and new AI questions. There is no other way to compute it. A second way
  silently splits the history, and the app starts repeating the questions it exists to
  stop repeating. This becomes rule 6 when phase 3 lands.
- **Privacy is per document.** `users/{uid}` is owner-only (birth year, consent,
  preferences); what the family sees lives in `families/{id}/members/{uid}`. `asks` and
  `tellings` carry `memberUids`, `tellerUid` and `listenerUid` so collection-group
  queries can be authorized — keep them in sync on write. The teller sees whom they
  told what across **all** their bonds; a listener sees nothing from a bond they are
  not in.
- **`assets/content/decks/vinculo.json` is product-owned content.** Never edit card
  text, reformat the file, or "improve" it.
- Firestore is the source of truth. `shared_preferences` holds only device-level state:
  theme, UI locale before sign-in, analytics consent, age-gate lock, milestones already
  celebrated.
- After an `await` in a Riverpod 3 notifier, check `ref.mounted` before touching
  `state`. In a `State`, use `mounted`, not `context.mounted`.
- `freezed` is pinned to `4.0.0-dev.3` deliberately; no stable release resolves with
  `riverpod_generator` 4.0.9 on Dart 3.12. Do not "upgrade" it. `Override` comes from
  `riverpod_annotation`; `.select` from `flutter_riverpod`.
- `AppThemeExtension` needs `==` and `hashCode` over every field, or `AnimatedTheme`
  animates on every rebuild. Nunito is a variable font: set `fontVariations` **and**
  `fontWeight`.
- `TextScaler.scale(x)` is nonlinear on Android 14+. Never use it to size layout.
- No Firebase Dynamic Links (shut down August 2025): App Links / Universal Links over
  Firebase Hosting, plus a typed fallback code.
- Identifiers, file names and doc comments in English; explanatory comments in Spanish.

## For the reviewer

- Do not ask for tests. See *Setup and verification*.
- A doc comment explaining why something is safe is a **hypothesis, not evidence**.
  Three of the five findings in the first review landed exactly on comments that
  justified the behaviour they were wrong about. Check the claim, not the comment.
- Scope for v1 is the beta. Deferred to v1.1: audio and photos, non-family bonds, real
  billing. Never built: a numeric bond score, audio transcription, web. Also out of v1
  unless asked: pending-invite management, removing members, leaving a family without
  deleting the account, deleting a single bond, exporting stories, translating
  user-written questions. A suggestion to add one of these is out of scope, not a
  finding.
