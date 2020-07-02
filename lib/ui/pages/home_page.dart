import 'package:appsolutely/models/app_state.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

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
                AppStateModel.router.navigateTo(
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
                AppStateModel.router.navigateTo(
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
                AppStateModel.router.navigateTo(
                  context,
                  '/what',
                );
              },
              child: Text('What is this'),
            ),
          ),
        ],
      ),
    );
  }
}
