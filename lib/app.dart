import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/screens/journal_entries_screen.dart';
import 'package:journal/screens/journal_entry_screen.dart';
import 'package:journal/screens/new_entry_screen.dart';
import 'screens/welcome_screen.dart';

class MyApp extends StatelessWidget {

  static final routes = {
    '/': (context) => WelcomeScreen(),
    'one_entry': (context) => JournalEntryScreen(),
    'new_entry': (context) => NewEntryScreen(),
    'all_entry': (context) => JournalEntriesScreen()
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      routes: routes,
    );
  }
}
