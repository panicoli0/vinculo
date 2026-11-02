import 'package:flutter/widgets.dart';

/// [full] unless the user asked the system to reduce motion, in which case it
/// is [Duration.zero] so the animation resolves instantly.
Duration appDuration(BuildContext context, Duration full) =>
    MediaQuery.disableAnimationsOf(context) ? Duration.zero : full;
