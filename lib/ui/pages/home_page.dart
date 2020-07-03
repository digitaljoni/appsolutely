import 'package:appsolutely/models/app_theme.dart';
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
    final router = Provider.of<Router>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('App Title'),
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
              value: Provider.of<AppTheme>(context).isDarkMode,
              onChanged: (bool isDarkMode) {
                Provider.of<AppTheme>(context, listen: false)
                    .updateThemeMode(isDarkMode);
              },
            ),
          )
        ],
      ),
    );
  }
}
