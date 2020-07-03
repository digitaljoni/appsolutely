import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  Application({Key key, this.router}) : super(key: key);

  final Router router;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Router>.value(value: router),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Title',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: router.generator,
      ),
    );
  }
}
