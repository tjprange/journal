import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/screens/journal_entries_screen.dart';
import 'package:journal/screens/journal_entry_screen.dart';
import 'package:journal/screens/new_entry_screen.dart';
import 'screens/welcome_screen.dart';

// class MyApp extends StatefulWidget {
//   static final routes = {
//     '/': (context) => WelcomeScreen(/*isDark: isDark*/),
//     'one_entry': (context) => JournalEntryScreen(),
//     'new_entry': (context) => NewEntryScreen(),
//     'all_entry': (context) => JournalEntriesScreen()
//   };

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.light(),
//       routes: MyApp.routes,
//     );
//   }
// }

class MyApp extends StatefulWidget {
  static bool isDark = false;
  bool get getIsDark => isDark;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  void updateTheme() {
    setState(() {
      MyApp.isDark = !MyApp.isDark;
    });
  }

  static final routes = {
    '/': (context) => WelcomeScreen(/*isDark: isDark*/ /*updateTheme: updateTheme,*/),
    'one_entry': (context) => JournalEntryScreen(),
    'new_entry': (context) => NewEntryScreen(),
    'all_entry': (context) => JournalEntriesScreen()
  };

  void initState() {
    super.initState();
    //isDark = !isDark;
    //isDark = false;
  }

  // ThemeData _getTheme() {
  //   //print(MyApp.isDark);
  //   if (MyApp.isDark == false) {
  //     return ThemeData.light();
  //   } else {
  //     return ThemeData.dark();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: /*_getTheme()*/ MyApp.isDark
          ? ThemeData.dark()
          : ThemeData.light(),
      routes: routes,
    );
  }
}
