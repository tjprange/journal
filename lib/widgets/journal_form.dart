import 'package:flutter/material.dart';
import 'package:journal/widgets/textformfield_widget.dart';
import 'package:journal/models/journal_entry.dart';

class JournalForm extends StatefulWidget {
  @override
  _JournalForm createState() => _JournalForm();
}

class _JournalForm extends State<JournalForm> {
  final formKey = GlobalKey<FormState>();
  final journalEntry = JournalEntry();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          // Custom FormFields
          textFormFieldWidget(context, 'Title', journalEntry),
          textFormFieldWidget(context, 'Body', journalEntry),
          textFormFieldWidget(context, 'Rating', journalEntry),
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
                  formKey.currentState.save();
                  // TODO: Navigate to next screen here
                  print('${journalEntry.title}');
                  print('${journalEntry.body}');
                  print('${journalEntry.rating}');
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
