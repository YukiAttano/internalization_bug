import 'package:flutter/material.dart';

import '../generated/l10n.dart';

/// Translates with the following files:
///
/// ```
/// /generated
///   /intl
///     messages_all.dart
///     messages_de.dart
///     messages_en.dart
///   l10n.dart
/// ```
///
/// Runs with `dart run intl_utils:generate`
class IntlLocalizer extends StatelessWidget {
  final Widget Function(S s) builder;

  const IntlLocalizer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);

    return builder(s);
  }
}
