import 'package:flutter/material.dart';
import 'package:journal/app.dart';
import 'package:journal/models/journal_entry.dart';

class HorizontalScrollList extends StatefulWidget {
  @override
  _HorizontalScrollListState createState() => _HorizontalScrollListState();
}

// This will desplay a ListView of journal entries on the left 
// and a selected journal entry on the right 
class _HorizontalScrollListState extends State<HorizontalScrollList> {
  JournalEntry journalEntry;

  void updateEntry(JournalEntry entry) {
    journalEntry = entry;
  }

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.findAncestorStateOfType<MyAppState>();
    int listSize = appState.entries.length;

    return Row(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: listSize,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(appState.entries[index].body),
              subtitle: Text(appState.entries[index].date),
              onTap: () {
                setState(() {
                  updateEntry(appState.entries[index]);
                });
              },
              selected: journalEntry == appState.entries[index],
            );
          },
        )),
        Expanded(
          child: getWidget(journalEntry),
        )
        //expanded  list tile with selection
      ],
    );
  }
}

// This will return a blank list if no entries exists
// Or a list of entries if otherwise
Widget getWidget(JournalEntry entry) {
  if (entry == null) {
    // right side of screen is blank on initial build
    return Text('');
  } else {
    // return a list tile including the contents of the selected journal entry
    return ListTile(
      leading: Icon(Icons.format_align_justify),
      title: Text
      (
          entry.title +
              ' ' +
              entry.date,
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(entry.body),
      trailing: Text('Rating:' + entry.rating.toString()),
    );
  }
}
