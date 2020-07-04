import 'package:appsolutely/generated/l10n.dart';
import 'package:appsolutely/models/app_state.dart';
import 'package:appsolutely/ui/styles/dark_theme.dart';
import 'package:appsolutely/ui/styles/light_theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';

class StartApp extends StatelessWidget {
  StartApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var router = Provider.of<Router>(context, listen: false);
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateTitle: (context) => S.of(context).appTitle,
          darkTheme: darkTheme,
          theme: lightTheme,
          themeMode: (appState.isDarkMode) ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: router.generator,
        );
      },
    );
  }
}
