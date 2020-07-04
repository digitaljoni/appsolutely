import 'package:appsolutely/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  AppState();

  bool _isDarkMode = false;
  String _currentLocale;

  bool get isDarkMode => _isDarkMode;
  String get currentLocale => _currentLocale;

  bool get isReady => _isReady();

  bool _isReady() {
    return _isDarkMode != null && _currentLocale != null;
  }

  void updateThemeMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    notifyListeners();
  }

  void changeLocale(String localeString) {
    if (_currentLocale == localeString) {
      return;
    }
    S.load(Locale(localeString));
    _currentLocale = localeString;
    notifyListeners();
  }
}
