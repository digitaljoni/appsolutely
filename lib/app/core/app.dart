import 'package:appsolutely/app/business_logic/repositories/app_state_repository.dart';
import 'package:appsolutely/app/business_logic/services/app_state_local.dart';
import 'package:appsolutely/app/config/styles/dark_theme.dart';
import 'package:appsolutely/app/config/styles/light_theme.dart';
import 'package:appsolutely/app/core/app_routes.dart';
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

  AppStateRepository appStateRepository;

  Future<void> init() async {
    // initialize theme
    _initTheme();

    // init logging
    _initRouter();
    await _initSharedPrefs();
    _initRepository();
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

  void _initRepository() {
    appStateRepository = AppStateRepository(
      local: AppStateLocal(
        prefs: _prefs,
      ),
    );
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
