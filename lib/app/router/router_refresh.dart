import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'router_gate.dart';

part 'router_refresh.g.dart';

/// Notifies the router each time the [RouterGate] changes, so it re-runs its
/// `redirect`.
///
/// El estado de sesión cambia de forma asíncrona (Rootsy no tenía este caso).
/// Nunca reconstruye el provider: si lo hiciera, `appRouter` se recrearía y se
/// perdería la pila de navegación.
@Riverpod(keepAlive: true)
Listenable routerRefresh(Ref ref) {
  final ValueNotifier<RouterGate> notifier = ValueNotifier<RouterGate>(
    ref.read(routerGateProvider),
  );
  ref.listen<RouterGate>(
    routerGateProvider,
    (RouterGate? previous, RouterGate next) => notifier.value = next,
  );
  ref.onDispose(notifier.dispose);
  return notifier;
}
