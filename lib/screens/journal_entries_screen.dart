import 'package:flutter/material.dart';
import 'package:journal/components/drawer_widget.dart';
import 'package:journal/components/entry_scroll_list.dart';

class JournalEntriesScreen extends StatefulWidget {
  @override
  _JournalEntriesScreenState createState() => _JournalEntriesScreenState();
}

class _JournalEntriesScreenState extends State<JournalEntriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Center(child: Text('Journal Entries')),
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
        body: EntryScrollList(),
        endDrawer: DrawerWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'new_entry');
          },
          child: Icon(Icons.add),
        ));
  }
}
