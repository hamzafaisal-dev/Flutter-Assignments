import 'package:flutter/material.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({super.key});

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          // maxLength: 50,
          onChanged: (email) {
            setState(() {
              _showError = email.length > 50;
            });
          },
          decoration: InputDecoration(
            label: Text(
              'Email',
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorLight,
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
        ),
        const SizedBox(height: 2),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            _showError ? 'Email cannot exceed 50 characters*' : '',
            style: const TextStyle(color: Color.fromARGB(255, 221, 27, 13)),
          ),
        ),
      ],
    );
  }
}
