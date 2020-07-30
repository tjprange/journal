import 'package:flutter/material.dart';
import 'package:journal/app.dart';

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
              value: MyApp().getIsDark,
              onChanged: (value) {
                setState(() {
                  MyApp.isDark = value;
                  //MyApp().setIsDark(value);
                  //print(value);
                });
              }),
        ],
      )
    ]));
  }
}
