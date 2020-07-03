import 'package:appsolutely/models/app_theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class StartApp extends StatelessWidget {
  StartApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var router = Provider.of<Router>(context, listen: false);
    return Consumer<AppTheme>(
      builder: (context, appTheme, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App Title',
          darkTheme: appTheme.dark,
          theme: appTheme.light,
          themeMode: (appTheme.isDarkMode) ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: router.generator,
        );
      },
    );
  }
}
