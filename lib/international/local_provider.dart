import 'local_services.dart';
import 'package:flutter/material.dart';

/// A provider class to handle changes for Locales
class LocaleProvider with ChangeNotifier {
  late Locale locale;
  // Maintain a list of code to name for all supported locales
  static Map<String, String> codeToName = {
    "en": "English",
    "hi": "Hindi",
    "te": "Telugu",
  };

  LocaleProvider() {
    // Get the current locale from shared preferences
    locale = LocaleService().getCurrentLocale();
  }

  /// Change the locale to the given language
  void changeLanguage(String language, {String? second}) {
    locale = Locale(language, second ?? "");
    // Save the new locale to shared preferences
    LocaleService().setCurrentLocale(locale);
    debugPrint("Updated locale to ${locale.toString()}. Notify listeners");
    notifyListeners();
  }
}
