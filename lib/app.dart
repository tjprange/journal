import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/screens/journal_entries_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/welcome_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:journal/models/journal.dart';

class MyApp extends StatefulWidget {
  // static final routes = {
  //   '/': (context) => WelcomeScreen(),
  //   //'one_entry': (context) => JournalEntryScreen(),
  //   'new_entry': (context) => NewEntryScreen(),
  //   'all_entry': (context) => JournalEntriesScreen()
  // };

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isDark = false;
  bool get getIsDark => isDark;

  // Holds list of journal entries
  List<JournalEntry> entries = [];
  //Journal journal;

  void initState() {
    super.initState();

    initIsDark();
    loadJournal();
  }

  // This function will load the journalEntries stored in journal.db
  void loadJournal() async {
    //await deleteDatabase('journal.db');
    final Database database = await openDatabase('journal.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, rating INTEGER, date TEXT);');
    });
    
    List<Map> journalRecords =
        await database.rawQuery('SELECT * FROM journal_entries');

    setState(() {
      //journal = Journal(entries: journalEntries);
      entries = journalRecords.map((record) {
        return JournalEntry(
            title: record['title'],
            body: record['body'],
            rating: record['rating'],
            date: record['date']);
      }).toList();
    });
  }

  // Will save the bool which determines the theme in shared preferences
  void initIsDark() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDark = prefs.getBool('isDark');
    });
  }

  // function to swap bool used for theme settings
  void updateTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  // this will choose the home:
  //  WelcomeScreen if no entries, otherwise JournalEntries
  Widget _checkHomeScreen() {
    if (entries.length == 0) {
      return WelcomeScreen();
    }
    return JournalEntriesScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: isDark ? ThemeData.dark() : ThemeData.light(),

      home: _checkHomeScreen(),
      //routes: MyApp.routes,
    );
  }
}
