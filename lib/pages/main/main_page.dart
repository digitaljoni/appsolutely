import 'package:appsolutely/app/application.dart';
import 'package:appsolutely/generated/l10n.dart';
import 'package:appsolutely/pages/main/tabs/location_tab.dart';
import 'package:appsolutely/pages/main/tabs/main_tab.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  static const routeName = '/main';
  static var routeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MainPage();
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int tabIndex;

  List<Widget> tabs = [
    MainTab(),
    LocationTab(),
  ];

  @override
  void initState() {
    super.initState();
    tabIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final application = Provider.of<Application>(context, listen: false);
    final router = application.router;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                router.navigateTo(
                  context,
                  '/settings',
                );
              }),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                S.of(context).appTitle,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text(S.of(context).profile),
              onTap: () {
                Navigator.pop(context);
                router.navigateTo(context, '/profile/4567');
              },
            ),
            ListTile(
              title: Text(S.of(context).settings),
              onTap: () {
                Navigator.pop(context);
                router.navigateTo(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: tabs[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (int index) {
          setState(() {
            tabIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Location'),
          ),
        ],
      ),
    );
  }
}
