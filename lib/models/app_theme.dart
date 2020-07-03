import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  AppTheme({@required this.light, @required this.dark});
  final ThemeData light;
  final ThemeData dark;

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void updateThemeMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    notifyListeners();
  }
}
