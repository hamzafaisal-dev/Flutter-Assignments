import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput(
      {super.key,
      required this.label,
      required this.hintText,
      required this.setPassword});

  final String label;
  final String? hintText;
  final void Function(String password) setPassword;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _showError = false;
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.setPassword(_passwordController.text);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          obscureText: true,
          maxLength: 20,
          onChanged: (password) {
            setState(() {
              _showError = password.length > 20;
            });
          },
          controller: _passwordController,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          decoration: InputDecoration(
            label: Text(
              widget.label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            hintText: widget.hintText ?? "",
            hintStyle: const TextStyle(fontSize: 12),
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
        Text(
          _showError ? 'Password cannot exceed 20 characters*' : '',
          style: const TextStyle(color: Color.fromARGB(255, 221, 27, 13)),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
