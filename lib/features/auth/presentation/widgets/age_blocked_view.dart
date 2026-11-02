import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_route.dart';
import '../../../../core/assets/app_illustration.dart';
import '../../../../core/i18n/translations.g.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/illustration_view.dart';
import '../../../../core/widgets/secondary_pill_button.dart';

/// What a person sees after the age gate rejected them (spec §3.1): the
/// "ask your guardian" message and the way in with a code.
///
/// No ofrece los botones de Google ni Apple; "Tengo un código" sí queda, porque
/// es el camino con el que el adulto de la familia le da acceso.
final class AgeBlockedView extends StatelessWidget {
  /// Creates the view.
  const AgeBlockedView({super.key});

  @override
  Widget build(BuildContext context) {
    final Translations t = context.t;
    return Column(
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
        Semantics(
          liveRegion: true,
          child: Text(
            t.age.blocked,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        SecondaryPillButton(
          label: t.signIn.haveCode,
          onPressed: () => context.pushNamed(AppRoute.code.routeName),
        ),
      ],
    );
  }
}
