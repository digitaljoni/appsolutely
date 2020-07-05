import 'package:appsolutely/config/styles/dark_theme.dart';
import 'package:appsolutely/config/styles/light_theme.dart';
import 'package:appsolutely/routes/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App {
  AppTheme _theme;
  Router _router;
  SharedPreferences _prefs;

  AppTheme get theme => _theme;
  Router get router => _router;
  SharedPreferences get preferences => _prefs;

  Future<void> init() async {
    // initialize theme
    _initTheme();

    // init logging
    _initRouter();
    await _initSharedPrefs();
    // init db services (Sqflite)
    // init api services
    // init repositories
  }

  void dispose() {
    // add close on any listeners
  }

  void _initTheme() {
    // initialize theme based on files in config/theme
    _theme = AppTheme(
      light: lightTheme,
      dark: darkTheme,
    );
  }

  void _initRouter() {
    // initialize router and routes
    _router = Router();
    Routes.configureRoutes(_router);
  }

  Future<void> _initSharedPrefs() async {
    // initialize shared preferences
    _prefs = await SharedPreferences.getInstance();
  }
}

class AppTheme {
  AppTheme({
    @required this.light,
    @required this.dark,
  });
  final ThemeData light;
  final ThemeData dark;
}
