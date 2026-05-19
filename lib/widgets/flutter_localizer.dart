import 'package:flutter/material.dart';

import '../l10n/l10n.dart';

/// Translates with the following files:
///
/// ```
/// /l10n
///   l10n.dart
///   l10n_de.dart
///   l10n_en.dart
/// ```
///
/// Runs with `flutter gen-l10n`
class FlutterLocalizer extends StatelessWidget {
  final Widget Function(AppLocalizations s) builder;

  const FlutterLocalizer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    AppLocalizations s = AppLocalizations.of(context)!;

    return builder(s);
  }
}
