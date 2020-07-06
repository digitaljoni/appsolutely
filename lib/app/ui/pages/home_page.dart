import 'package:appsolutely/app/business_logic/view_models/app_view_model.dart';
import 'package:appsolutely/app/core/app.dart';
import 'package:appsolutely/app/ui/pages/loading_page.dart';
import 'package:appsolutely/generated/l10n.dart';
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
    final appState = Provider.of<AppViewModel>(context).appState;

    if (!appState.isReady) {
      return LoadingPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                final router = Provider.of<App>(context, listen: false).router;

                router.navigateTo(
                  context,
                  '/settings',
                );
              }),
        ],
      ),
      body: Center(
        child: Text('Home page'),
      ),
    );
  }
}
