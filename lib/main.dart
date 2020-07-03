import 'package:appsolutely/app/app.dart';
import 'package:appsolutely/routes/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

void main() {
  // initialize router and routes
  final router = Router();
  Routes.configureRoutes(router);

  runApp(
    Application(
      router: router,
    ),
  );
}
