import "package:flutter/material.dart";

import "flutter_localizer.dart";
import "intl_localizer.dart";

class LocalizationComparison extends StatelessWidget {

  final CrossAxisAlignment crossAxisAlignment;

  const LocalizationComparison({super.key, this.crossAxisAlignment = CrossAxisAlignment.end});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        FlutterLocalizer(
          builder: (s) {
            return SelectableText(
              "Flutter: ${s.helloWorld}",
              style: theme.textTheme.displayMedium,
            );
          },
        ),
        IntlLocalizer(
          builder: (s) {
            return SelectableText(
              "Intl: ${s.helloWorld}",
              style: theme.textTheme.displayMedium,
            );
          },
        ),
      ],
    );
  }
}
