import 'package:appsolutely/app/business_logic/view_models/app_view_model.dart';
import 'package:appsolutely/app/core/app.dart';
import 'package:appsolutely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  AppWidget(this.app, {Key key}) : super(key: key);

  final App app;

  @override
  _AppWidgetState createState() => _AppWidgetState(app);
}

class _AppWidgetState extends State<AppWidget> {
  _AppWidgetState(this._app);

  final App _app;
  AppViewModel _appViewModel;

  @override
  void initState() {
    super.initState();

    // initialize appState
    _appViewModel = AppViewModel(
      repository: _app.appStateRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<App>.value(value: _app),
        ChangeNotifierProvider<AppViewModel>.value(value: _appViewModel)
      ],
      child: _MaterialApp(),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  _MaterialApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _application = Provider.of<App>(context, listen: false);
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, _) {
        final appState = appViewModel.appState;
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
