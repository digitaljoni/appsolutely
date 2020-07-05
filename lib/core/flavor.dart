import 'package:appsolutely/core/init_app.dart';
import 'package:appsolutely/core/app.dart';
import 'package:flutter/material.dart';

enum FlavorType {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
}

class Flavor {
  Flavor() {
    _instance = this;
    _init();
  }

  FlavorType flavorType = FlavorType.PRODUCTION;

  static Flavor _instance;
  static Flavor get instance => _instance;

  bool get isDevelopment => flavorType == FlavorType.DEVELOPMENT;
  bool get isStaging => flavorType == FlavorType.STAGING;
  bool get isProduction => flavorType == FlavorType.PRODUCTION;

  Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();

    if (flavorType == FlavorType.DEVELOPMENT ||
        flavorType == FlavorType.STAGING) {
      // set Logging level to high
    }

    final application = App();
    await application.init();
    runApp(InitApp(application));
  }
}
