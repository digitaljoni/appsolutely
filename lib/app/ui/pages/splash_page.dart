import 'package:appsolutely/app/config/styles/colors.dart';
import 'package:appsolutely/app/core/app.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  static const routeName = '/';
  static var routeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SplashPage();
  });

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppStyle.primaryColor,
            AppStyle.accentColor,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/app_logo.png'),
            RaisedButton(
              child: Text('START'),
              onPressed: () {
                final router = Provider.of<App>(context, listen: false).router;

                router.navigateTo(
                  context,
                  '/home',
                  replace: true,
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
