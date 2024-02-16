import 'package:bugtest/screens/screen_one.dart';
import 'package:bugtest/screens/simple_screen.dart';
import 'package:bugtest/widgets/localizer.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

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
        child: Column(
          children: [
            const Text("The below text should be 'Hallo Welt'"),
            Localizer(
              builder: (s) {
                return Text(
                  S.of(context).helloWorld,
                  style: theme.textTheme.displayMedium,
                );
              },
            ),
          ],
        )
      ),
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
