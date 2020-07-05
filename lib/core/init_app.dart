import 'package:appsolutely/core/start_app.dart';
import 'package:appsolutely/core/app.dart';
import 'package:appsolutely/models/app_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class InitApp extends StatefulWidget {
  InitApp(this.app, {Key key}) : super(key: key);

  final App app;

  @override
  _InitAppState createState() => _InitAppState(app);
}

class _InitAppState extends State<InitApp> {
  _InitAppState(this._app);

  final App _app;
  AppState _appState;

  @override
  void initState() {
    super.initState();

    // get brightness mode
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    // initialize appState
    _appState = AppState();
    _appState.updateThemeMode(isDarkMode);
    _appState.changeLocale('en');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<App>.value(value: _app),
        ChangeNotifierProvider<AppState>.value(value: _appState)
      ],
      child: StartApp(),
    );
  }
}
