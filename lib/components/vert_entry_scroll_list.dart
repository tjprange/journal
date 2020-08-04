import 'package:flutter/material.dart';
import 'package:journal/app.dart';
import 'package:journal/screens/journal_entry_screen.dart';

class VertEntryScrollList extends StatefulWidget {
  @override
  _VertEntryScrollListState createState() => _VertEntryScrollListState();
}

// This will display a list of journal entries and then navigate
// to another page to display the details of the selected entry
class _VertEntryScrollListState extends State<VertEntryScrollList> {

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
