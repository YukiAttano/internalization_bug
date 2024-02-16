import 'package:bugtest/screens/screen_two.dart';
import 'package:bugtest/screens/simple_screen.dart';
import 'package:bugtest/widgets/localizer.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(colorScheme: theme.colorScheme.copyWith(primary: Colors.red)),
      child: SimpleScreen(
        title:  const Text("English"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("The below text should be 'Hello World'"),
            Localizer(
              builder: (s) {
                return Text(
                  S.of(context).helloWorld,
                  style: theme.textTheme.displayMedium,
                );
              },
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
