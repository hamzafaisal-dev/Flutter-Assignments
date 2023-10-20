import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key, required this.label, required this.hintText});

  final String label;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      maxLength: 20,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        hintText: hintText ?? "",
        hintStyle: const TextStyle(fontSize: 12),
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
