import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/i18n/translations.g.dart';
import '../../core/theme/app_spacing.dart';

/// Bottom navigation shell hosting the four tab branches (spec §4).
final class AppShell extends StatelessWidget {
  /// Creates the shell around [navigationShell].
  const AppShell({required this.navigationShell, super.key});

  /// Branch state owned by the [StatefulShellRoute].
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final Translations t = context.t;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        // Ícono y texto siempre visibles (spec §4). La altura es fija: nunca
        // se deriva de TextScaler.scale (no es lineal en Android 14+).
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        height: AppSpacing.minTouchTarget + AppSpacing.lg,
        onDestinationSelected: (int index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: const Icon(Icons.local_florist_outlined),
            selectedIcon: const Icon(Icons.local_florist),
            label: t.tabs.garden,
            tooltip: t.tabs.garden,
          ),
          NavigationDestination(
            icon: const Icon(Icons.help_outline),
            selectedIcon: const Icon(Icons.help),
            label: t.tabs.questions,
            tooltip: t.tabs.questions,
          ),
          NavigationDestination(
            icon: const Icon(Icons.menu_book_outlined),
            selectedIcon: const Icon(Icons.menu_book),
            label: t.tabs.stories,
            tooltip: t.tabs.stories,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: t.tabs.settings,
            tooltip: t.tabs.settings,
          ),
        ],
      ),
    );
  }
}
