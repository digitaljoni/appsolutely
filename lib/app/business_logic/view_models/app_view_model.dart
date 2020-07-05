import 'package:appsolutely/app/business_logic/models/app_state.dart';
import 'package:appsolutely/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppViewModel extends ChangeNotifier {
  AppViewModel() {
    appState = AppState.empty();
  }

  AppState appState;

  void updateThemeMode(bool isDarkMode) {
    appState = appState.copyWith(isDarkMode: isDarkMode);
    notifyListeners();
  }

  void changeLocale(String localeString) {
    if (appState.currentLocale == localeString) {
      return;
    }
    S.load(Locale(localeString));

    appState = appState.copyWith(currentLocale: localeString);
    notifyListeners();
  }
}
