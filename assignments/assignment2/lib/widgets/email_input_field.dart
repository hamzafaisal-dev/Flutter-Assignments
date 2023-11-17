import 'package:flutter/material.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({super.key, required this.setEmail});

  final void Function(String email) setEmail;

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  bool _showError = false;

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.setEmail(_emailController.text);

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
          controller: _emailController,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          decoration: InputDecoration(
            label: Text(
              'Email',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            fillColor: Theme.of(context).colorScheme.background,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                // width: 2.0,
              ),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
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
