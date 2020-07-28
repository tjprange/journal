import 'package:flutter/material.dart';
import 'package:journal/widgets/journal_form.dart';

class NewEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Journal Entry')
      ),
      body: JournalForm(),
    );
  }
}