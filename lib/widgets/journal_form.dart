import 'package:flutter/material.dart';
import 'package:journal/widgets/textformfield_widget.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/app.dart';

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
          //textFormFieldWidget(context, 'Rating', journalEntry),
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
          // Row with two buttons
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            RaisedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  journalEntry.date = DateTime.now();
                  formKey.currentState.save();
                  appState.entries.add(journalEntry);
                  //print(appState.entries);

                  // TODO: Navigate to next screen here
                  Navigator.pushNamed(context, 'all_entry');
                  //print('${journalEntry.title}');
                  //print('${journalEntry.body}');
                  //print('${journalEntry.rating}');
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
