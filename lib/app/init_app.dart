import 'package:appsolutely/app/start_app.dart';
import 'package:appsolutely/models/app_state.dart';
import 'package:appsolutely/routes/routes.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class InitApp extends StatelessWidget {
  InitApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // initialize router and routes
    final router = Router();
    Routes.configureRoutes(router);

    // get brightness mode
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    var isDarkMode = brightness == Brightness.dark;

    // initialize appState
    final appState = AppState();
    appState.updateThemeMode(isDarkMode);

    appState.changeLocale('en');

    return MultiProvider(
      providers: [
        Provider<Router>.value(value: router),
        ChangeNotifierProvider<AppState>.value(
          value: appState,
        )
      ],
      child: StartApp(),
    );
  }
}
