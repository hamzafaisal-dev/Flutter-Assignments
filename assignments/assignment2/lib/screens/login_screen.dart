import 'package:assignment2/screens/signup_screen.dart';
import 'package:assignment2/widgets/email_input_field.dart';
import 'package:assignment2/widgets/login_button.dart';
import 'package:assignment2/widgets/password_input_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 5),
                  child: Image.asset(
                    'assets/asset1-removebg-preview.png',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, top: 30),
                  child: ToggleSwitch(
                    minWidth: 50.0,
                    initialLabelIndex: brightnessToggleIndex,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.black,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: const [Icons.brightness_3, Icons.brightness_6_sharp],
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
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Log In',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                  const EmailInput(),
                  const PasswordInput(label: 'Password', hintText: null),
                  // const SizedBox(height: 25),
                  const LoginButton(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const SignUpScreen(),
                          //   ),
                          // );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen(),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Forgot password?',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )
                    ],
                  ),
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
