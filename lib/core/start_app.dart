import 'package:appsolutely/generated/l10n.dart';
import 'package:appsolutely/core/app.dart';
import 'package:appsolutely/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class StartApp extends StatelessWidget {
  StartApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _application = Provider.of<App>(context, listen: false);
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
          darkTheme: _application.theme.dark,
          theme: _application.theme.light,
          themeMode: (appState.isDarkMode) ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: _application.router.generator,
        );
      },
    );
  }
}
