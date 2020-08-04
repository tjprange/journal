import 'package:flutter/material.dart';
import 'package:journal/widgets/textformfield_widget.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/app.dart';
import 'package:journal/screens/journal_entries_screen.dart';
import 'package:sqflite/sqflite.dart';

class JournalForm extends StatefulWidget {
  @override
  _JournalForm createState() => _JournalForm();
}

class _JournalForm extends State<JournalForm> {
  final formKey = GlobalKey<FormState>();
  final journalEntry = JournalEntry();

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.findAncestorStateOfType<MyAppState>();

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          // Custom FormFields
          textFormFieldWidget(context, 'Title', journalEntry),
          textFormFieldWidget(context, 'Body', journalEntry),
          TextFormField(
              // numeric value w/ validation
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Rating', border: OutlineInputBorder()),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please complete form';
                }
                //rating must have int validation
                if (int.parse(value) < 1 || int.parse(value) > 4) {
                  return 'Rating must be 1-4';
                }
                return null;
              },
              onSaved: (value) {
                journalEntry.rating = int.parse(value);
              }),
          // Row with two buttons (Cancel and Submit)
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            RaisedButton(
              onPressed: () async {
                if (formKey.currentState.validate()) {
                  DateTime date = DateTime.now();

                  // Convert to mm/dd/yyyy format
                  String day = date.day.toString();
                  String month = date.month.toString();
                  String year = date.year.toString();
                  String today = day + '/' + month + '/' + year;
                  journalEntry.date = today;

                  //journalEntry.date = DateTime.now().toString();
                  formKey.currentState.save();
                  appState.entries.add(journalEntry);

                  // Add submitted values to DB
                  final Database database = await openDatabase('journal.db',
                      version: 1, onCreate: (Database db, int version) async {
                    await db.execute(
                        'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, rating INTEGER, date TEXT);');
                  });
                  await database.transaction((txn) async {
                    await txn.rawInsert(
                        'INSERT INTO journal_entries(title, body, rating, date) VALUES (?, ?, ?, ?)',
                        [
                          journalEntry.title,
                          journalEntry.body,
                          journalEntry.rating,
                          today,
                        ]);
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JournalEntriesScreen()),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ])
        ]),
      ),
    );
  }
}
