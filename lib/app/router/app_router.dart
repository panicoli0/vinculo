import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/i18n/translations.g.dart';
import '../../core/widgets/placeholder_screen.dart';
import '../../features/auth/presentation/screens/age_screen.dart';
import '../../features/auth/presentation/screens/profile_unavailable_screen.dart';
import '../../features/auth/presentation/screens/sign_in_screen.dart';
import '../../features/auth/presentation/screens/welcome_screen.dart';
import '../../features/preferences/presentation/preferences_providers.dart';
import 'app_route.dart';
import 'app_shell.dart';
import 'router_gate.dart';
import 'router_refresh.dart';

part 'app_router.g.dart';

/// The app's [GoRouter]: a four-tab shell plus root-level stacked routes.
///
/// Bienvenida, ingreso y edad son reales; el resto son placeholders hasta las
/// fases 2 a 5. El `redirect` lee el [RouterGate] con `ref.read` y se vuelve a
/// ejecutar por el `refreshListenable`: si observara el gate, el router se
/// recrearía en cada cambio de sesión y perdería la pila de navegación.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoute.garden.path,
    refreshListenable: ref.watch(routerRefreshProvider),
    redirect: (BuildContext context, GoRouterState state) => _redirect(
      gate: ref.read(routerGateProvider),
      route: _routeAt(state.fullPath),
      pendingInviteCode: ref
          .read(preferencesControllerProvider)
          .pendingInviteCode,
    ),
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) => AppShell(navigationShell: navigationShell),
        branches: <StatefulShellBranch>[
          _tabBranch(AppRoute.garden, (Translations t) => t.tabs.garden),
          _tabBranch(AppRoute.questions, (Translations t) => t.tabs.questions),
          _tabBranch(AppRoute.stories, (Translations t) => t.tabs.stories),
          _tabBranch(AppRoute.settings, (Translations t) => t.tabs.settings),
        ],
      ),
      // Rutas explícitas, una por AppRoute: un AppRoute nuevo sin pantalla debe
      // notarse, no recibir un placeholder en silencio. Todas viven a nivel
      // raíz para cubrir la barra inferior (spec §4), incluida
      // `/settings/delete-account`.
      //
      // El orden importa: `/bonds/new` tiene que ir ANTES de `/bonds/:bondId`, o
      // lo captura como id. Las demás rutas no se solapan: go_router exige
      // coincidencia completa, así que `/family` nunca captura `/family/new`.
      _screenRoute(AppRoute.welcome, (_) => const WelcomeScreen()),
      _screenRoute(AppRoute.signIn, (_) => const SignInScreen()),
      _screenRoute(AppRoute.age, (_) => const AgeScreen()),
      _screenRoute(
        AppRoute.profileUnavailable,
        (_) => const ProfileUnavailableScreen(),
      ),
      _placeholderRoute(
        AppRoute.familyNew,
        (Translations t) => t.screens.familyNew.title,
      ),
      _placeholderRoute(
        AppRoute.invite,
        (Translations t) => t.screens.invite.title,
      ),
      _placeholderRoute(
        AppRoute.code,
        (Translations t) => t.screens.code.title,
      ),
      _placeholderRoute(
        AppRoute.bondNew,
        (Translations t) => t.screens.bondNew.title,
      ),
      _placeholderRoute(
        AppRoute.bond,
        (Translations t) => t.screens.bond.title,
      ),
      _placeholderRoute(
        AppRoute.bondAsk,
        (Translations t) => t.screens.bondAsk.title,
      ),
      _placeholderRoute(
        AppRoute.bondAskVariations,
        (Translations t) => t.screens.bondAskVariations.title,
      ),
      _placeholderRoute(
        AppRoute.bondTell,
        (Translations t) => t.screens.bondTell.title,
      ),
      _placeholderRoute(
        AppRoute.bondAskDetail,
        (Translations t) => t.screens.bondAskDetail.title,
      ),
      _placeholderRoute(
        AppRoute.bondStory,
        (Translations t) => t.screens.bondStory.title,
      ),
      _placeholderRoute(
        AppRoute.bondCheckpoint,
        (Translations t) => t.screens.bondCheckpoint.title,
      ),
      _placeholderRoute(
        AppRoute.bondSettings,
        (Translations t) => t.screens.bondSettings.title,
      ),
      _placeholderRoute(
        AppRoute.family,
        (Translations t) => t.screens.family.title,
      ),
      _placeholderRoute(
        AppRoute.familyMinorNew,
        (Translations t) => t.screens.familyMinorNew.title,
      ),
      _placeholderRoute(
        AppRoute.familyMinorCode,
        (Translations t) => t.screens.familyMinorCode.title,
      ),
      _placeholderRoute(
        AppRoute.deleteAccount,
        (Translations t) => t.screens.deleteAccount.title,
      ),
      _placeholderRoute(
        AppRoute.betaSubscription,
        (Translations t) => t.screens.betaSubscription.title,
      ),
    ],
    // La pantalla de error propia de go_router está en inglés sin traducir.
    errorBuilder: (BuildContext context, GoRouterState state) =>
        PlaceholderScreen(title: context.t.errors.notFound),
  );
}

/// Routes a signed-out person may open: the whole entry flow (spec §4).
const Set<AppRoute> _signedOutRoutes = <AppRoute>{
  AppRoute.welcome,
  AppRoute.signIn,
  AppRoute.age,
  AppRoute.code,
  AppRoute.invite,
};

/// Routes a signed-in person without a family may open.
const Set<AppRoute> _familySetupRoutes = <AppRoute>{
  AppRoute.familyNew,
  AppRoute.invite,
  AppRoute.code,
};

/// Entry-flow routes a fully set up person is moved away from.
const Set<AppRoute> _entryRoutes = <AppRoute>{
  AppRoute.welcome,
  AppRoute.signIn,
  AppRoute.age,
  AppRoute.profileUnavailable,
};

/// The [AppRoute] whose path pattern is [fullPath], or null when none is.
AppRoute? _routeAt(String? fullPath) {
  for (final AppRoute route in AppRoute.values) {
    if (route.path == fullPath) {
      return route;
    }
  }
  return null;
}

/// Where [gate] sends the person standing on [route]; null means "stay".
///
/// Sin sesión → `/welcome`; sin poder leer `users/{uid}` →
/// `/profile-unavailable`; sin `users/{uid}` → `/age`; sin familia →
/// `/family/new` (o `/invite/:code` si hay una invitación pendiente). Con
/// [RouterGate.loading] no se redirige: la app ya muestra su pantalla de carga
/// al arrancar y, más tarde, la decisión llega con el próximo cambio del gate.
String? _redirect({
  required RouterGate gate,
  required AppRoute? route,
  required String? pendingInviteCode,
}) {
  return switch (gate) {
    RouterGate.loading => null,
    RouterGate.signedOut =>
      _signedOutRoutes.contains(route) ? null : AppRoute.welcome.path,
    RouterGate.profileUnavailable =>
      route == AppRoute.profileUnavailable
          ? null
          : AppRoute.profileUnavailable.path,
    RouterGate.needsProfile => route == AppRoute.age ? null : AppRoute.age.path,
    RouterGate.needsFamily =>
      _familySetupRoutes.contains(route)
          ? null
          : _familySetupPath(pendingInviteCode),
    RouterGate.ready =>
      _entryRoutes.contains(route) ? AppRoute.garden.path : null,
  };
}

/// Landing of a person without a family: the pending invite or family creation.
String _familySetupPath(String? pendingInviteCode) => pendingInviteCode == null
    ? AppRoute.familyNew.path
    : AppRoute.invite.path.replaceFirst(
        ':code',
        Uri.encodeComponent(pendingInviteCode),
      );

/// One tab branch of the shell, with its own navigator and a placeholder.
StatefulShellBranch _tabBranch(
  AppRoute route,
  String Function(Translations t) title,
) {
  return StatefulShellBranch(
    navigatorKey: GlobalKey<NavigatorState>(debugLabel: route.routeName),
    routes: <RouteBase>[_placeholderRoute(route, title)],
  );
}

/// A root-level [GoRoute] for [route] showing the screen [builder] creates.
GoRoute _screenRoute(AppRoute route, WidgetBuilder builder) {
  return GoRoute(
    path: route.path,
    name: route.routeName,
    builder: (BuildContext context, GoRouterState state) => builder(context),
  );
}

/// A root-level [GoRoute] for [route] showing a [PlaceholderScreen].
GoRoute _placeholderRoute(
  AppRoute route,
  String Function(Translations t) title,
) {
  return GoRoute(
    path: route.path,
    name: route.routeName,
    builder: (BuildContext context, GoRouterState state) =>
        PlaceholderScreen(title: title(context.t)),
  );
}
