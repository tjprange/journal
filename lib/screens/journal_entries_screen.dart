import 'package:flutter/material.dart';
import 'package:journal/components/drawer_widget.dart';
import 'package:journal/components/vert_entry_scroll_list.dart';
import 'package:journal/components/horiz_entry_screen.dart';
import 'package:journal/screens/new_entry_screen.dart';


class JournalEntriesScreen extends StatefulWidget {
  @override
  _JournalEntriesScreenState createState() => _JournalEntriesScreenState();
}

// This class will determine the layout based on the available screen width
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
        body: LayoutBuilder(builder: layoutDecider),
        endDrawer: DrawerWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewEntryScreen()),
            );
          },
          child: Icon(Icons.add),
        ));
  }

  // Change layout based on screen constraints
  Widget layoutDecider(BuildContext context, BoxConstraints constraints) =>
      constraints.maxWidth < 500
          ? VertEntryScrollList()
          : HorizontalScrollList();
}

