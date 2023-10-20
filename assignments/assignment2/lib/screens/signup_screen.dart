import 'package:assignment2/screens/login_screen.dart';
import 'package:assignment2/widgets/email_input_field.dart';
import 'package:assignment2/widgets/login_button.dart';
import 'package:assignment2/widgets/password_input_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4F4),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/asset2.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                  const EmailInput(),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Expanded(
                        child: PasswordInput(
                            label: 'Password', hintText: 'Create Password'),
                      ),
                      SizedBox(width: 35),
                      Expanded(
                        child: PasswordInput(
                            label: 'Password', hintText: 'Confirm Password'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const SignUpButton(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Have an account? ',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: 'Log In',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
