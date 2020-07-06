import 'package:appsolutely/app/business_logic/view_models/app_view_model.dart';
import 'package:appsolutely/app/core/app_flavor.dart';
import 'package:appsolutely/app/ui/widgets/settings_language_widget.dart';
import 'package:appsolutely/app/utils/enums/flavor_type.dart';
import 'package:appsolutely/generated/l10n.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  static const routeName = '/settings';
  static var routeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SettingsPage();
  });

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppViewModel>(context).appState;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(S.of(context).settingsDarkMode),
            trailing: Switch(
              value: appState.isDarkMode,
              onChanged: (bool isDarkMode) {
                Provider.of<AppViewModel>(context, listen: false)
                    .updateThemeMode(isDarkMode);
              },
            ),
          ),
          ListTile(
            title: Text(S.of(context).settingsLanguage),
            trailing: SettingsLanguageWidget(),
          ),
          (AppFlavor.instance.flavorType == FlavorType.PRODUCTION)
              ? SizedBox()
              : ListTile(
                  title: Text(S.of(context).settingsEnvironment),
                  trailing: Text(
                    '${AppFlavor.instance.flavorType.toShortString()}',
                  ),
                ),
        ],
      ),
    );
  }
}
