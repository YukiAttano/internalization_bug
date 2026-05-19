import 'package:bugtest/screens/screen_two.dart';
import 'package:bugtest/screens/simple_screen.dart';
import 'package:bugtest/widgets/flutter_localizer.dart';
import 'package:flutter/material.dart';

import '../widgets/intl_localizer.dart';
import '../widgets/localization_comparison.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Localizations ancestor = context.findAncestorWidgetOfExactType<Localizations>()!;

    return Theme(
      data: theme.copyWith(colorScheme: theme.colorScheme.copyWith(primary: Colors.red)),
      child: SimpleScreen(
        title: const Text("English"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SelectableText("The below text should be 'Hello World'"),
            LocalizationComparison(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Application level Localizations: ${ancestor.isApplicationLevel}"),
                Text("Ancestor Locale: ${ancestor.locale}"),
                Text("Selected Locale: ${Localizations.localeOf(context)}"),
              ],
            ),
          ],
        ),
        button: OutlinedButton(
          onPressed: () => _onNavigate(context),
          child: const Text("Push TWO"),
        ),
      ),
    );
  }

  Future<void> _onNavigate(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ScreenTwo(),
      ),
    );
  }
}

extension Something on Localizations {
  List<LocalizationsDelegate<dynamic>> getDelegates() {
    return delegates;
  }
}
