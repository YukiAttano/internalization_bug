
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class Localizer extends StatelessWidget {

  final Widget Function(S s) builder;
  const Localizer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {

    S s = S.of(context);

    return builder(s);
  }
}
