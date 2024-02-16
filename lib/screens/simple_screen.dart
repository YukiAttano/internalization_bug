import 'package:bugtest/screens/screen_one.dart';
import 'package:bugtest/widgets/localizer.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class SimpleScreen extends StatelessWidget {

  final Widget title;
  final Widget body;

  final Widget button;
  const SimpleScreen({super.key, required this.title, required this.body, required this.button});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("If you use Navigator.pop() (e.g. the back button in the app bar), localization is correctly reverted. But if you use the button to Navigator.push() another screen, translation will persist."),
            const Divider(color: Colors.transparent),
            body,
            const Divider(color: Colors.transparent),
            button,
          ],
        ),
      ),
    );
  }

}
