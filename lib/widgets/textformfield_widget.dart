import 'package:flutter/material.dart';

Widget textFormFieldWidget(BuildContext context, String name) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: TextFormField(
      autofocus: true,
      decoration:
          InputDecoration(labelText: name, border: OutlineInputBorder()),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please complete form';
        }
        return null;
      },
    ),
  );
}
