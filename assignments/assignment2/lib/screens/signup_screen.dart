import 'package:assignment2/screens/login_screen.dart';
import 'package:assignment2/widgets/email_input_field.dart';
import 'package:assignment2/widgets/password_input_field.dart';
import 'package:assignment2/widgets/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var brightnessToggleIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brightnessToggleIndex == 1 ? Colors.white : Colors.black,
      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/asset2-removebg-preview.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ToggleSwitch(
                        minWidth: 50.0,
                        initialLabelIndex: 1,
                        cornerRadius: 20.0,
                        activeFgColor: Colors.black,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        icons: const [
                          Icons.brightness_3,
                          Icons.brightness_6_sharp
                        ],
                        activeBgColors: const [
                          [Colors.blue],
                          [Color.fromARGB(255, 255, 237, 73)]
                        ],
                        onToggle: (index) {
                          setState(() {
                            brightnessToggleIndex = index!;
                          });

                          // print(brightnessToggleIndex);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                  const EmailInput(),
                  const Row(
                    children: [
                      Expanded(
                        child: PasswordInput(
                          label: 'Password',
                          hintText: 'Create Password',
                        ),
                      ),
                      SizedBox(width: 35),
                      Expanded(
                        child: PasswordInput(
                          label: 'Password',
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ],
                  ),
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
                                  color: Theme.of(context).primaryColorLight,
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
