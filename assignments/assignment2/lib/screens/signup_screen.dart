import 'package:assignment2/screens/login_screen.dart';
import 'package:assignment2/widgets/email_input_field.dart';
import 'package:assignment2/widgets/password_input_field.dart';
import 'package:assignment2/widgets/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var brightnessToggleIndex = 1;

  late String emailAddress;
  late String password;

  void createUser() async {
    final userCredentials = await _firebase.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredentials.user!.uid)
        .set({'email': emailAddress});
  }

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
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/asset2-removebg-preview.png',
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
                        'Sign up',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                  EmailInput(
                    setEmail: (email) {
                      emailAddress = email;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PasswordInput(
                          label: 'Password',
                          hintText: 'Create Password',
                          setPassword: (pass) {
                            password = pass;
                          },
                        ),
                      ),
                      const SizedBox(width: 35),
                      Expanded(
                        child: PasswordInput(
                          label: 'Password',
                          hintText: 'Confirm Password',
                          setPassword: (pass) {
                            password = pass;
                          },
                        ),
                      ),
                    ],
                  ),
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: createUser,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(18),
                          child: Text(
                            'Create account',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
                                  color: Theme.of(context).colorScheme.primary,
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
