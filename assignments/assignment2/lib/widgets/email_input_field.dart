import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 50,
      decoration: InputDecoration(
        label: Text(
          'Email',
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorDark,
            // width: 2.0,
          ),
        ),
      ),
      buildCounter: (
        context, {
        required currentLength,
        maxLength,
        required isFocused,
      }) =>
          null,
    );
  }
}
