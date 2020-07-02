import 'package:appsolutely/models/app_state.dart';
import 'package:appsolutely/routes/routes.dart';
import 'package:appsolutely/ui/pages/home_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  Application({Key key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  Router router;

  @override
  void initState() {
    super.initState();

    router = Router();
    Routes.configureRoutes(router);
    AppStateModel.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: AppStateModel.router.generator,
    );
  }
}
