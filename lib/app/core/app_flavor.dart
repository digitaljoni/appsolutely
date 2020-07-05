import 'package:appsolutely/app/core/app_widget.dart';
import 'package:appsolutely/app/core/app.dart';
import 'package:appsolutely/app/utils/enums/flavor_type.dart';
import 'package:flutter/material.dart';

class AppFlavor {
  AppFlavor() {
    _instance = this;
    _init();
  }

  FlavorType flavorType = FlavorType.PRODUCTION;

  static AppFlavor _instance;
  static AppFlavor get instance => _instance;

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
    runApp(AppWidget(application));
  }
}
