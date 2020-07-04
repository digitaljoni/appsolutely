import 'package:appsolutely/generated/l10n.dart';
import 'package:appsolutely/models/app_state.dart';
import 'package:appsolutely/ui/pages/loading_page.dart';
import 'package:appsolutely/ui/widgets/locale_button_widget.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  static const routeName = '/';
  static var routeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomePage();
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final router = Provider.of<Router>(context, listen: false);

    final appState = Provider.of<AppState>(context);

    if (!appState.isReady) {
      return LoadingPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: FlatButton(
              onPressed: () {
                router.navigateTo(
                  context,
                  '/profile/12345',
                );
              },
              child: Text('Go to profile'),
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                router.navigateTo(
                  context,
                  '/login',
                );
              },
              child: Text('Login'),
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                router.navigateTo(
                  context,
                  '/what',
                );
              },
              child: Text('What is this'),
            ),
          ),
          Container(
            child: Switch(
              value: Provider.of<AppState>(context).isDarkMode,
              onChanged: (bool isDarkMode) {
                Provider.of<AppState>(context, listen: false)
                    .updateThemeMode(isDarkMode);
              },
            ),
          ),
          LocaleButtonWidget('en', 'English'),
          LocaleButtonWidget('es', 'Spanish'),
        ],
      ),
    );
  }
}
