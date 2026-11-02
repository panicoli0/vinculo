import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_theme_extension.dart';
import 'app_illustration.dart';
import 'illustration_resolver.dart';

/// [IllustrationResolver] that draws every [AppIllustration] with
/// [CustomPaint], using the scenery tokens of the active theme.
///
/// Placeholder art made of simple shapes: it can never be "missing", so the
/// UI has no broken-asset fallback to maintain.
final class PaintedIllustrations implements IllustrationResolver {
  /// Creates the resolver.
  const PaintedIllustrations();

  @override
  Widget build(
    BuildContext context,
    AppIllustration illustration, {
    required double size,
  }) {
    final ThemeData theme = Theme.of(context);
    // Siempre hay extensión en la app; el respaldo cubre un Theme ajeno.
    final AppThemeExtension tokens =
        theme.extension<AppThemeExtension>() ??
        AppThemeExtension.fromBrightness(theme.brightness, theme.colorScheme);
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: _IllustrationPainter(
          illustration: illustration,
          tokens: tokens,
        ),
      ),
    );
  }
}

/// Paints one [AppIllustration] on a 100 x 100 canvas scaled to fit.
final class _IllustrationPainter extends CustomPainter {
  const _IllustrationPainter({
    required this.illustration,
    required this.tokens,
  });

  final AppIllustration illustration;
  final AppThemeExtension tokens;

  /// Side of the square coordinate space every drawing is authored in.
  static const double _extent = 100;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / _extent);
    final _Pen pen = _Pen(tokens);
    switch (illustration) {
      case AppIllustration.mascotWaving:
        _mascot(canvas, pen, waving: true);
      case AppIllustration.mascotSitting:
        _mascot(canvas, pen, waving: false);
      case AppIllustration.tree:
        _ground(canvas, pen);
        _tree(canvas, pen, scale: 1, blossoms: true);
      case AppIllustration.gardenStage1:
        _ground(canvas, pen);
        _sprout(canvas, pen, stemTop: 72, leafSpan: 9);
      case AppIllustration.gardenStage2:
        _ground(canvas, pen);
        _sprout(canvas, pen, stemTop: 60, leafSpan: 16);
      case AppIllustration.gardenStage3:
        _ground(canvas, pen);
        _sprout(canvas, pen, stemTop: 44, leafSpan: 18, tiers: 2);
      case AppIllustration.gardenStage4:
        _ground(canvas, pen);
        _tree(canvas, pen, scale: 0.62, blossoms: false);
      case AppIllustration.gardenStage5:
        _ground(canvas, pen);
        _tree(canvas, pen, scale: 0.9, blossoms: true);
        _flower(canvas, pen, const Offset(14, 82), 3.2);
        _flower(canvas, pen, const Offset(86, 80), 3.6);
      case AppIllustration.emptyFavorites:
        _ground(canvas, pen);
        _heart(canvas, pen, const Offset(46, 50), 24);
        _sprout(canvas, pen, stemTop: 74, leafSpan: 9, x: 82);
      case AppIllustration.deckComplete:
        _ground(canvas, pen);
        _tree(canvas, pen, scale: 0.88, blossoms: true);
        _sparkle(canvas, pen, const Offset(14, 22), 7);
        _sparkle(canvas, pen, const Offset(87, 16), 5);
        _sparkle(canvas, pen, const Offset(90, 50), 4);
      case AppIllustration.notFound:
        _signpost(canvas, pen);
    }
  }

  @override
  bool shouldRepaint(_IllustrationPainter oldDelegate) =>
      oldDelegate.illustration != illustration || oldDelegate.tokens != tokens;

  // ---- Shapes -------------------------------------------------------------

  static void _ground(Canvas canvas, _Pen pen) {
    canvas.drawOval(const Rect.fromLTRB(6, 84, 94, 100), pen.fill(pen.meadow));
  }

  /// Sprout mascot: blob body, two-leaf sprout, face and arms.
  static void _mascot(Canvas canvas, _Pen pen, {required bool waving}) {
    canvas.drawOval(const Rect.fromLTRB(20, 88, 80, 98), pen.fill(pen.meadow));
    // Pies y brazos van detrás del cuerpo.
    for (final double x in <double>[38, 62]) {
      final Rect foot = Rect.fromCenter(
        center: Offset(x, 92),
        width: 16,
        height: 8,
      );
      canvas.drawOval(foot, pen.fill(pen.foliage));
      canvas.drawOval(foot, pen.line(2));
    }
    final List<Path> arms = <Path>[
      Path()
        ..moveTo(27, 68)
        ..quadraticBezierTo(16, 72, 15, 80),
      waving
          ? (Path()
              ..moveTo(73, 64)
              ..quadraticBezierTo(90, 60, 89, 44))
          : (Path()
              ..moveTo(73, 68)
              ..quadraticBezierTo(84, 72, 85, 80)),
    ];
    for (final Path arm in arms) {
      canvas.drawPath(arm, pen.line(9));
      canvas.drawPath(arm, pen.line(5, color: pen.foliage));
    }

    final RRect body = RRect.fromRectAndCorners(
      const Rect.fromLTWH(24, 38, 52, 54),
      topLeft: const Radius.elliptical(26, 30),
      topRight: const Radius.elliptical(26, 30),
      bottomLeft: const Radius.circular(18),
      bottomRight: const Radius.circular(18),
    );
    canvas.drawRRect(body, pen.fill(pen.foliage));
    canvas.drawRRect(body, pen.line(2.2));
    canvas.drawOval(
      const Rect.fromLTWH(31, 46, 9, 15),
      pen.fill(pen.highlight.withValues(alpha: 0.7)),
    );

    // Brote.
    canvas.drawLine(const Offset(50, 40), const Offset(50, 28), pen.line(3));
    _leaf(canvas, pen, const Offset(50, 30), const Offset(30, 16), 8);
    _leaf(canvas, pen, const Offset(50, 30), const Offset(70, 16), 8);

    // Cara.
    for (final double x in <double>[41, 59]) {
      canvas.drawOval(
        Rect.fromCenter(center: Offset(x, 61), width: 6, height: 8),
        pen.fill(pen.ink),
      );
      canvas.drawCircle(Offset(x + 1, 59), 1.2, pen.fill(Colors.white));
    }
    for (final double x in <double>[34, 66]) {
      canvas.drawCircle(
        Offset(x, 69),
        4.5,
        pen.fill(pen.blossom.withValues(alpha: 0.85)),
      );
    }
    canvas.drawPath(
      Path()
        ..moveTo(44, 68)
        ..quadraticBezierTo(50, 77, 56, 68),
      pen.line(2),
    );
  }

  /// Tree on its trunk base at (50, 94), optionally scaled around that base.
  static void _tree(
    Canvas canvas,
    _Pen pen, {
    required double scale,
    required bool blossoms,
  }) {
    canvas.save();
    canvas.translate(50, 94);
    canvas.scale(scale);
    canvas.translate(-50, -94);

    final Path trunk = Path()
      ..moveTo(39, 94)
      ..quadraticBezierTo(47, 80, 45, 54)
      ..lineTo(55, 54)
      ..quadraticBezierTo(53, 80, 61, 94)
      ..close();
    pen.shape(canvas, trunk, pen.bark);

    const List<(Offset, double)> canopy = <(Offset, double)>[
      (Offset(50, 30), 20),
      (Offset(30, 44), 15),
      (Offset(70, 44), 15),
      (Offset(50, 50), 15),
    ];
    // Primero todos los contornos y luego los rellenos: el borde queda solo en
    // la silueta exterior de la copa.
    for (final (Offset center, double radius) in canopy) {
      canvas.drawCircle(center, radius, pen.line(5));
    }
    for (final (Offset center, double radius) in canopy) {
      canvas.drawCircle(center, radius, pen.fill(pen.foliage));
    }
    canvas.drawCircle(
      const Offset(43, 24),
      8,
      pen.fill(pen.highlight.withValues(alpha: 0.5)),
    );
    if (blossoms) {
      _heart(canvas, pen, const Offset(50, 31), 8);
      for (final Offset spot in const <Offset>[
        Offset(33, 46),
        Offset(66, 40),
        Offset(56, 56),
      ]) {
        canvas.drawCircle(spot, 3, pen.fill(pen.blossom));
        canvas.drawCircle(spot, 3, pen.line(1.2));
      }
    }
    canvas.restore();
  }

  /// Seedling growing from a soil mound; [stemTop] is the y of the tip and
  /// [tiers] the number of leaf pairs along the stem.
  static void _sprout(
    Canvas canvas,
    _Pen pen, {
    required double stemTop,
    required double leafSpan,
    int tiers = 1,
    double x = 50,
  }) {
    canvas.drawOval(
      Rect.fromCenter(center: Offset(x, 90), width: 30, height: 12),
      pen.fill(pen.bark),
    );
    canvas.drawLine(Offset(x, 88), Offset(x, stemTop), pen.line(3));
    for (int tier = 0; tier < tiers; tier++) {
      final double y = stemTop + tier * 18;
      final double span = leafSpan - tier * 2;
      _leaf(canvas, pen, Offset(x, y + 4), Offset(x - span, y - 8), 7);
      _leaf(canvas, pen, Offset(x, y + 4), Offset(x + span, y - 8), 7);
    }
  }

  /// Leaf from [base] to [tip]; [bulge] is how far its sides swell.
  static void _leaf(
    Canvas canvas,
    _Pen pen,
    Offset base,
    Offset tip,
    double bulge,
  ) {
    final Offset delta = tip - base;
    final Offset normal = Offset(-delta.dy, delta.dx) / delta.distance * bulge;
    final Offset middle = (base + tip) / 2;
    final Path leaf = Path()
      ..moveTo(base.dx, base.dy)
      ..quadraticBezierTo(
        middle.dx + normal.dx,
        middle.dy + normal.dy,
        tip.dx,
        tip.dy,
      )
      ..quadraticBezierTo(
        middle.dx - normal.dx,
        middle.dy - normal.dy,
        base.dx,
        base.dy,
      );
    pen.shape(canvas, leaf, pen.foliage);
  }

  static void _heart(Canvas canvas, _Pen pen, Offset center, double size) {
    final Path heart = Path()
      ..moveTo(center.dx, center.dy + size * 0.9)
      ..cubicTo(
        center.dx - size * 1.6,
        center.dy + size * 0.1,
        center.dx - size * 1.0,
        center.dy - size * 1.0,
        center.dx,
        center.dy - size * 0.3,
      )
      ..cubicTo(
        center.dx + size * 1.0,
        center.dy - size * 1.0,
        center.dx + size * 1.6,
        center.dy + size * 0.1,
        center.dx,
        center.dy + size * 0.9,
      );
    pen.shape(canvas, heart, pen.blossom, width: size > 12 ? 2.4 : 1.6);
  }

  static void _flower(Canvas canvas, _Pen pen, Offset at, double radius) {
    canvas.drawLine(at, at + Offset(0, radius * 3), pen.line(1.4));
    for (int petal = 0; petal < 5; petal++) {
      final double angle = petal * 2 * math.pi / 5;
      final Offset center = at + Offset.fromDirection(angle, radius * 0.95);
      canvas.drawCircle(center, radius * 0.7, pen.fill(pen.blossom));
    }
    canvas.drawCircle(at, radius * 0.6, pen.fill(pen.bark));
  }

  static void _sparkle(Canvas canvas, _Pen pen, Offset center, double radius) {
    final double pinch = radius * 0.28;
    final Path star = Path()
      ..moveTo(center.dx, center.dy - radius)
      ..lineTo(center.dx + pinch, center.dy - pinch)
      ..lineTo(center.dx + radius, center.dy)
      ..lineTo(center.dx + pinch, center.dy + pinch)
      ..lineTo(center.dx, center.dy + radius)
      ..lineTo(center.dx - pinch, center.dy + pinch)
      ..lineTo(center.dx - radius, center.dy)
      ..lineTo(center.dx - pinch, center.dy - pinch)
      ..close();
    pen.shape(canvas, star, pen.blossom, width: 1.4);
  }

  static void _signpost(Canvas canvas, _Pen pen) {
    for (final (Offset center, double radius) in const <(Offset, double)>[
      (Offset(22, 24), 8),
      (Offset(33, 21), 11),
      (Offset(45, 25), 7),
    ]) {
      canvas.drawCircle(center, radius, pen.fill(pen.sky));
    }
    _ground(canvas, pen);
    final Path post = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          const Rect.fromLTWH(46, 34, 8, 60),
          const Radius.circular(3),
        ),
      );
    pen.shape(canvas, post, pen.bark);
    final Color board = Color.lerp(pen.bark, Colors.white, 0.3)!;
    final Path toRight = Path()
      ..moveTo(28, 42)
      ..lineTo(66, 42)
      ..lineTo(76, 50)
      ..lineTo(66, 58)
      ..lineTo(28, 58)
      ..close();
    final Path toLeft = Path()
      ..moveTo(72, 62)
      ..lineTo(34, 62)
      ..lineTo(24, 70)
      ..lineTo(34, 78)
      ..lineTo(72, 78)
      ..close();
    pen.shape(canvas, toRight, board);
    pen.shape(canvas, toLeft, board);
    _sprout(canvas, pen, stemTop: 76, leafSpan: 8, x: 84);
  }
}

/// Colors and brushes of one painting pass, derived from the theme tokens.
final class _Pen {
  _Pen(AppThemeExtension tokens)
    : sky = tokens.scenerySky,
      meadow = tokens.sceneryMeadow,
      foliage = tokens.sceneryFoliage,
      bark = tokens.sceneryBark,
      blossom = tokens.sceneryBlossom,
      highlight = Color.lerp(tokens.sceneryFoliage, Colors.white, 0.45)!,
      // Contorno: el follaje muy oscurecido, legible en claro y en oscuro.
      ink = HSLColor.fromColor(
        tokens.sceneryFoliage,
      ).withLightness(0.16).withSaturation(0.35).toColor();

  final Color sky;
  final Color meadow;
  final Color foliage;
  final Color bark;
  final Color blossom;
  final Color highlight;
  final Color ink;

  Paint fill(Color color) => Paint()..color = color;

  Paint line(double width, {Color? color}) => Paint()
    ..color = color ?? ink
    ..style = PaintingStyle.stroke
    ..strokeWidth = width
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  /// Fills [path] with [color] and outlines it.
  void shape(Canvas canvas, Path path, Color color, {double width = 2}) {
    canvas.drawPath(path, fill(color));
    canvas.drawPath(path, line(width));
  }
}
