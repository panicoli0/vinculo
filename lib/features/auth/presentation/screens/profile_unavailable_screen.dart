import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/assets/app_illustration.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../core/errors/failure_message.dart';
import '../../../../core/i18n/translations.g.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/illustration_view.dart';
import '../../../../core/widgets/primary_pill_button.dart';
import '../../../../core/widgets/secondary_pill_button.dart';
import '../../domain/app_user.dart';
import '../auth_providers.dart';

/// Shown when the account is signed in but its `users/{uid}` document could not
/// be read, typically offline with no cached copy.
///
/// Tiene un mensaje, un reintento y una salida (cerrar sesión). Si el stream
/// del documento sigue abierto, también se recupera solo al volver la red: el
/// router saca a la persona de acá cuando llega el dato.
final class ProfileUnavailableScreen extends ConsumerWidget {
  /// Creates the screen.
  const ProfileUnavailableScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Translations t = context.t;
    final AsyncValue<AppUser?> user = ref.watch(currentUserProvider);
    final Object? error = user.error;
    final String message = error is AppFailure
        ? failureMessage(t, error)
        : t.errors.generic;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Center(
                    child: IllustrationView(
                      illustration: AppIllustration.mascotSitting,
                      size: 160,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    t.profileUnavailable.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Semantics(
                    liveRegion: true,
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  PrimaryPillButton(
                    label: t.profileUnavailable.retry,
                    isBusy: user.isLoading,
                    onPressed: () => ref.invalidate(currentUserProvider),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SecondaryPillButton(
                    label: t.profileUnavailable.signOut,
                    onPressed: () => _signOut(context, ref),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Signs out and tells the person when that failed; on success the router
  /// leaves this screen by itself.
  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(authRepositoryProvider).signOut();
    } on AppFailure catch (failure) {
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failureMessage(context.t, failure))),
      );
    }
  }
}
