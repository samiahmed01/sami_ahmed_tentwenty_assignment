import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  late final Locale locale;

  AppLocalizations(this.locale);
  static List<Locale> get supportedLanguages => const _AppLocalizationsDelegate().supportedLanguages;
  bool isSupported(Locale type) => const _AppLocalizationsDelegate().isSupported(type);

  // Helper method to keep the code in the widgets concise Localizations are
  // accessed using an InheritedWidget "of" syntax
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings = {};
 // Map<String, String> _localizedStringsDefault = {};

  Future<bool> load() async {

    List<String> languagePaths = [
      'assets/i18n/account/${locale.languageCode}.json',
      'assets/i18n/common/${locale.languageCode}.json',
      'assets/i18n/lesson/${locale.languageCode}.json',
      'assets/i18n/login/${locale.languageCode}.json',
      'assets/i18n/onlineActivity/${locale.languageCode}.json',
      'assets/i18n/progress/${locale.languageCode}.json',
      'assets/i18n/saved/${locale.languageCode}.json',
      'assets/i18n/sidebar/${locale.languageCode}.json',
      'assets/i18n/signup/${locale.languageCode}.json',
      'assets/i18n/subjects/${locale.languageCode}.json',
      'assets/i18n/subscription/${locale.languageCode}.json',
      'assets/i18n/teacher/${locale.languageCode}.json',
      'assets/i18n/chat/${locale.languageCode}.json',
    ];

    Map<String, String> combinedLocalizedStrings = {};

    for (var path in languagePaths) {
      try {
        String jsonString = await rootBundle.loadString(path);
        Map<String, dynamic> jsonMap = json.decode(jsonString);
        jsonMap.forEach((key, value) {
          combinedLocalizedStrings[key] = value.toString();
        });
      } catch (e) {
        debugPrint('Error loading language file at $path: $e');
      }
    }

    _localizedStrings = combinedLocalizedStrings;

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key] != null
        ? _localizedStrings[key].toString()
        : key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  List<Locale> get supportedLanguages => [
    const Locale('en'),
    const Locale('ar'),
  ];

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return supportedLanguages.contains(locale);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
