import 'package:flutter/material.dart';
import 'package:journal/widgets/textformfield_widget.dart';

class JournalForm extends StatefulWidget {
  @override
  _JournalForm createState() => _JournalForm();
}

class _JournalForm extends State<JournalForm> {
  
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textFormFieldWidget(context, 'Title'),
          textFormFieldWidget(context, 'Body'),
          textFormFieldWidget(context, 'Rating')
        ]
      )
    );
  }
}
