import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service class to manage the current locale of the app
class LocaleService {
  // Key for the current locale to be used for shared preferences
  String currentLocalePrefKey = "currentLocale";
  // Stores the current locale of the app (defaults to "en")
  Locale currentLocale = const Locale("en");
  late SharedPreferences prefs;

  // Create a singleton instance of this class
  static final LocaleService _singleton = LocaleService._internal();
  factory LocaleService() {
    return _singleton;
  }
  LocaleService._internal();

  /// Initializes the shared preferences
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    debugPrint("Initialized shared preferences");
  }

  /// Fetches the current locale set for the app
  Locale getCurrentLocale() {
    String? currentLocaleString = prefs.getString(currentLocalePrefKey);
    debugPrint("Current locale fetched from shared preferences : $currentLocaleString");
    if (currentLocaleString != null) {
      // Split it by the underscore character
      var splitArray = currentLocaleString.split("_");
      if(splitArray.length > 1){
        // If locale string is "en_US" => splitArray = ["en","US"]
        currentLocale = Locale(splitArray[0], splitArray[1]);
      } else if(splitArray.length == 1){
        // If locale string is just "en" => splitArray = ["en"]
        currentLocale = Locale(splitArray[0]);
      } else {
        // If locale string was an empty string "" => splitArray = []
        debugPrint("Invalid current locale string : $currentLocaleString");
      }
    }
    return currentLocale;
  }

  /// Sets the current locale for the app
  void setCurrentLocale(Locale locale) async {
    currentLocale = locale;
    bool success =
    await prefs.setString(currentLocalePrefKey, currentLocale.toString());
    if (success) {
      debugPrint(
          "Current locale successfully updated to ${currentLocale.toString()} in shared preferences");
    } else {
      debugPrint(
          "Failed to update current locale in shared preferences to : ${currentLocale.toString()}");
    }
  }
}
