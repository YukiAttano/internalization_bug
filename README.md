# bugtest

Bugtest

## The bug

This project shows, that intl_utils generates a localization implementation which is not correctly scoped, 
when a `Localizations.override` Widget was used on a previous Screen. See https://github.com/flutter/flutter/issues/143446
for more information.

# Intl Setup

Intl generates it's localization under the following circumstances:

pubspec.yaml has the following entries:
```yaml
flutter_intl:
  enabled: true
```

Config file:
`pubspec.yaml` -> `flutter_intl` section

Input files:
```
/lib/l10n/intl_en.arb
/lib/l10n/intl_de.arb
```

Output files:
```
/lib/generated/intl/messages_all.dart
/lib/generated/intl/messages_de.dart
/lib/generated/intl/messages_en.dart
/lib/generated/l10n.dart
```

triggered with:
`dart run intl_utils:generate`

# Flutter l10n Setup

Flutter generates it's localization under the following circumstances:

pubspec.yaml has the following entries:
```yaml
flutter:
  generate: true
```

Config file:
`l10n.yaml`

Input files (defined by the config file):
```
/lib/l10n/intl_en.arb
/lib/l10n/intl_de.arb
```

Output files:
```
/lib/l10n/l10n.dart
/lib/l10n/l10n_de.dart
/lib/l10n/l10n_en.dart
```

triggered with:
`flutter gen-l10n`
