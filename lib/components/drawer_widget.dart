import 'package:flutter/material.dart';
import 'package:journal/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  // bool isDark;
  // DrawerWidget({this.isDark});
  final void Function() updateTheme;
  DrawerWidget({this.updateTheme});

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState(/*isDark: isDark*/);
}

class _DrawerWidgetState extends State<DrawerWidget> {
  // bool isDark;
  // _DrawerWidgetState({this.isDark});
  @override
  Widget build(BuildContext context) {
    // reach up in the widget tree for MyAppState widget
    MyAppState appState = context.findAncestorStateOfType<MyAppState>();

    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        child: Text('Settings'),
        decoration: BoxDecoration(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Dark Mode:'),
          Switch(
              value: appState.getIsDark,
              onChanged: (value) {
                setState(() async {
                  appState.updateTheme();
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('isDark', appState.getIsDark);
                });
              }),
        ],
      )
    ]));
  }
}
