import 'package:flutter/material.dart';
import 'package:journal/components/drawer_widget.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/screens/new_entry_screen.dart';

class JournalEntryScreen extends StatefulWidget {
  final JournalEntry journalEntry;
  JournalEntryScreen({Key key, @required this.journalEntry}) : super(key: key);

  @override
  _JournalEntryScreenState createState() =>
      _JournalEntryScreenState(journalEntry: journalEntry);
}

class _JournalEntryScreenState extends State<JournalEntryScreen> {
  JournalEntry journalEntry;
  _JournalEntryScreenState({this.journalEntry});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Center(child: Text('Journal Entry')),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                _openEndDrawer();
              },
            )
          ],
        ),
        body: ListTile(
          leading: Icon(Icons.format_align_justify),
          title: Text(
              journalEntry.title +
                  ' ' +
                  journalEntry.date.day.toString() +
                  '/' +
                  journalEntry.date.month.toString() +
                  '/' +
                  journalEntry.date.year.toString(),
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(journalEntry.body),
          trailing: Text('Rating:' + journalEntry.rating.toString()),
        ),
        endDrawer: DrawerWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Navigator.pushNamed(context, 'new_entry');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewEntryScreen()),
            );
          },
          child: Icon(Icons.add),
        ));
  }
}
