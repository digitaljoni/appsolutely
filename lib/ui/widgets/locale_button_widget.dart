import 'package:appsolutely/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocaleButtonWidget extends StatelessWidget {
  const LocaleButtonWidget(this.localeString, this.localeTitle, {Key key})
      : super(key: key);

  final String localeString;
  final String localeTitle;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        final appState = Provider.of<AppState>(context, listen: false);
        appState.changeLocale('$localeString');
      },
      child: Text('$localeTitle'),
    );
  }
}
