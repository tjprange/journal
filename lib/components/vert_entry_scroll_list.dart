import 'package:flutter/material.dart';
import 'package:journal/app.dart';
import 'package:journal/screens/journal_entry_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/models/journal.dart';

class VertEntryScrollList extends StatefulWidget {
  @override
  _VertEntryScrollListState createState() => _VertEntryScrollListState();
}

class _VertEntryScrollListState extends State<VertEntryScrollList> {
  // Journal journal;

  // @override
  // void initState() {
  //   super.initState();
  //   // loadJournal();
  // }

  // void loadJournal() async {
  //   //journal = Journal.fake();
  //   // final Database database = await openDatabase('journal.db', version: 1,
  //   //     onCreate: (Database db, int version) async {
  //   //   await db.execute(
  //   //       'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, rating INTEGER, date TEXT);');
  //   // });
  //   // List<Map> journalRecords =
  //   //     await database.rawQuery('SELECT * FROM journal_entries');

  //   // final journalEntries = journalRecords.map((record) {
  //   //   return JournalEntry(
  //   //       title: record['title'],
  //   //       body: record['body'],
  //   //       rating: record['rating'],
  //   //       date: record['date']);
  //   // }).toList();
  //   // setState(() {
  //   //   journal = Journal(entries: journalEntries);
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.findAncestorStateOfType<MyAppState>();
    int listSize = appState.entries.length;

    
    return ListView.builder(
      itemCount: listSize,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(appState.entries[index].title),
            subtitle: Text(appState.entries[index].date),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JournalEntryScreen(
                          journalEntry: appState.entries[index])));
            });
      },
    );
  }
}
