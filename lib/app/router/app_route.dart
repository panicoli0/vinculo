/// Every route in the app, with its path (spec §4).
///
/// Las rutas viven acá y nunca como strings sueltos en el código.
enum AppRoute {
  /// Garden tab: the shared garden and recent activity (§4).
  garden('/garden'),

  /// Questions tab: pending and sent questions (§4).
  questions('/questions'),

  /// Stories tab: stories already told (§4).
  stories('/stories'),

  /// Settings tab (§4).
  settings('/settings'),

  /// First screen of the signed-out flow (§4).
  welcome('/welcome'),

  /// Sign in with Google or Apple (§4).
  signIn('/sign-in'),

  /// Age gate shown before creating an account (§4).
  age('/age'),

  /// Signed in but the user document could not be read; offers a retry.
  profileUnavailable('/profile-unavailable'),

  /// Creation of the user's own family (§4).
  familyNew('/family/new'),

  /// Landing of an invite link, carrying its `:code` (§4).
  invite('/invite/:code'),

  /// Manual entry of an invite or minor code (§4).
  code('/code'),

  /// Creation of a bond (§4).
  bondNew('/bonds/new'),

  /// Detail of one bond, carrying its `:bondId` (§4).
  bond('/bonds/:bondId'),

  /// Asking a question inside a bond (§4).
  bondAsk('/bonds/:bondId/ask'),

  /// Browsing the variations of a card, carrying its `:cardId` (§4).
  bondAskVariations('/bonds/:bondId/ask/variations/:cardId'),

  /// Telling a story without having been asked (§4).
  bondTell('/bonds/:bondId/tell'),

  /// Detail of one question, carrying its `:askId` (§4).
  bondAskDetail('/bonds/:bondId/asks/:askId'),

  /// Detail of one story, carrying its `:tellingId` (§4).
  bondStory('/bonds/:bondId/stories/:tellingId'),

  /// Review of the bond's progress (§4).
  bondCheckpoint('/bonds/:bondId/checkpoint'),

  /// Settings of one bond (§4).
  bondSettings('/bonds/:bondId/settings'),

  /// Members of the family (§4).
  family('/family'),

  /// Creation of a minor profile (§4).
  familyMinorNew('/family/minor/new'),

  /// One-time code of a minor profile, carrying its `:uid` (§4).
  familyMinorCode('/family/minor/:uid/code'),

  /// Account deletion; root-level so it covers the bottom bar (§4).
  deleteAccount('/settings/delete-account'),

  /// Subscription fake door shown at the end of the trial (§4).
  betaSubscription('/beta/subscription');

  const AppRoute(this.path);

  /// Location this route is served at.
  final String path;

  /// Name used by `goNamed` / `pushNamed`.
  String get routeName => name;
}
