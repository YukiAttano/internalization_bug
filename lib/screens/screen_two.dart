import 'package:bugtest/screens/screen_one.dart';
import 'package:bugtest/screens/simple_screen.dart';
import 'package:bugtest/widgets/flutter_localizer.dart';
import 'package:bugtest/widgets/intl_localizer.dart';
import 'package:bugtest/widgets/localization_comparison.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SimpleScreen(
      title: const Text("German"),
      body: Localizations.override(
          context: context,
          locale: const Locale('de'),
          child: Builder(builder: (context) {
            Localizations ancestor = context.findAncestorWidgetOfExactType<Localizations>()!;

            return Column(
              children: [
                const SelectableText("The below text should be 'Hallo Welt'"),
                // "Hello World"
                LocalizationComparison(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Application level Localizations: ${ancestor.isApplicationLevel}"),
                    Text("Ancestor Locale: ${ancestor.locale}"),
                    Text("Selected Locale: ${Localizations.localeOf(context)}"),
                  ],
                )
              ],
            );
          })),
      button: OutlinedButton(
        onPressed: () => _onNavigate(context),
        child: const Text("Push ONE"),
      ),
    );
  }

  Future<void> _onNavigate(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ScreenOne(),
      ),
    );
  }
}
