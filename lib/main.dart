import 'package:bugtest/screens/screen_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'l10n/l10n.dart';

void main() {
  runApp(const Bugtest());
}

class Bugtest extends StatelessWidget {
  const Bugtest({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Internalization Bugtest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        S.delegate,
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale("en"),
      supportedLocales: _supportedLocales(),
      home: const ScreenOne(),
    );
  }

  static List<Locale> _supportedLocales() {
    var flutterLocales = AppLocalizations.supportedLocales;
    var intlLocales = S.delegate.supportedLocales;

    List<Locale> supported = flutterLocales.where((l) => intlLocales.contains(l)).toList();

    assert(supported.length == intlLocales.length, "Locale mismatch: Intl supports less locales; Did you run `dart run intl_utils:generate`?");
    assert(supported.length == flutterLocales.length, "Locale mismatch Fluter support less locales; Did you run `flutter gen-l10n`?");
    return supported;
  }
}
