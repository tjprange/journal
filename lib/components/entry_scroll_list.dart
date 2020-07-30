import 'package:flutter/material.dart';
import 'package:journal/app.dart';

class EntryScrollList extends StatefulWidget {
  @override
  _EntryScrollListState createState() => _EntryScrollListState();
}

class _EntryScrollListState extends State<EntryScrollList> {
  //final items = List<Map> .generate(, (index) => null)

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.findAncestorStateOfType<MyAppState>();
    int listSize = appState.entries.length;

    return ListView.builder(
      itemCount: listSize,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(appState.entries[index].body),
            subtitle: Text(appState.entries[index].date.toString()));
      },
    );
  }
}
