import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../config/app_environment.dart';
import '../errors/console_error_reporter.dart';
import '../errors/error_reporter.dart';
import 'firebase_options_dev.dart' as dev_options;
import 'firebase_options_prod.dart' as prod_options;

/// Region where the Cloud Functions are deployed. Every callable must be
/// obtained through [vinculoFunctions]: `FirebaseFunctions.instance` points at
/// `us-central1` and would skip the emulator wiring of [initializeFirebase].
const String functionsRegion = 'us-west1';

/// The [FirebaseFunctions] instance every callable must use.
///
/// Solo es válido después de [initializeFirebase]: antes, `Firebase.app()`
/// lanza `core/no-app`.
FirebaseFunctions get vinculoFunctions =>
    FirebaseFunctions.instanceFor(region: functionsRegion);

/// Initializes Firebase for [environment] with the generated
/// [FirebaseOptions], points the SDKs at the local emulators when
/// [useEmulators] is on and activates App Check. A failure to activate App
/// Check is reported to [errorReporter] instead of aborting the startup.
///
/// Called only when `AppConfig.useFirebase` is on; with it off the app never
/// touches Firebase.
///
/// `options:` se pasa siempre a propósito: ahora que existe configuración
/// nativa (`google-services.json` / `GoogleService-Info.plist`),
/// `Firebase.initializeApp()` sin argumentos arrancaría igual leyéndola, y los
/// `firebase_options_*` generados quedarían muertos sin que nada avise. El
/// switch exhaustivo de [_optionsFor] es el único resguardo durable: agregar un
/// `AppEnvironment` rompe la compilación en vez de apuntar al proyecto
/// equivocado en silencio.
Future<void> initializeFirebase(
  AppEnvironment environment, {
  required bool useEmulators,
  ErrorReporter errorReporter = const ConsoleErrorReporter(),
}) async {
  await Firebase.initializeApp(options: _optionsFor(environment));
  if (useEmulators) {
    await _connectToEmulators();
  }
  // App Check no debe tumbar el arranque: sin él las Functions rechazan, pero
  // el resto de la app funciona y el error queda reportado.
  try {
    await _activateAppCheck();
  } on Object catch (error, stackTrace) {
    errorReporter.reportNonFatal(
      'app_check_activation_failed',
      cause: error,
      stackTrace: stackTrace,
    );
  }
}

/// Points Auth, Firestore and Functions at the local emulators.
///
/// Los emuladores deben configurarse antes del primer uso de cada SDK. El host
/// se resuelve a mano: `10.0.2.2` es el alias de la máquina anfitriona dentro
/// del emulador de Android; el simulador de iOS comparte la red del Mac.
Future<void> _connectToEmulators() async {
  final String host = switch (defaultTargetPlatform) {
    TargetPlatform.android => '10.0.2.2',
    TargetPlatform.iOS ||
    TargetPlatform.macOS ||
    TargetPlatform.windows ||
    TargetPlatform.linux ||
    TargetPlatform.fuchsia => 'localhost',
  };
  await FirebaseAuth.instance.useAuthEmulator(host, 9099);
  FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
  vinculoFunctions.useFunctionsEmulator(host, 5001);
}

/// Activates App Check: debug providers in debug builds, Play Integrity and
/// App Attest in release.
///
/// En el SDK 0.5.1 `activate` recibe clases de provider, no los enums
/// `AndroidProvider` / `AppleProvider`.
Future<void> _activateAppCheck() => FirebaseAppCheck.instance.activate(
  providerAndroid: kDebugMode
      ? const AndroidDebugProvider()
      : const AndroidPlayIntegrityProvider(),
  providerApple: kDebugMode
      ? const AppleDebugProvider()
      : const AppleAppAttestProvider(),
);

/// Generated options of the Firebase project behind [environment].
FirebaseOptions _optionsFor(AppEnvironment environment) =>
    switch (environment) {
      AppEnvironment.dev => dev_options.DefaultFirebaseOptions.currentPlatform,
      AppEnvironment.prod =>
        prod_options.DefaultFirebaseOptions.currentPlatform,
    };
