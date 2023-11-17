import 'package:assignment2/screens/signup_screen.dart';
import 'package:assignment2/widgets/email_input_field.dart';
import 'package:assignment2/widgets/login_button.dart';
import 'package:assignment2/widgets/password_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var brightnessToggleIndex = 1;
  late String emailAddress;
  late String password;

  late Map<String, dynamic> _userData;
  AccessToken? _accessToken;

  void login() async {
    final userCredentials = await _firebase.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  }
  //https://fir-class-work-87464.firebaseapp.com/__/auth/handler

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      _accessToken = loginResult.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(loginResult.status);
      print(loginResult.message);
    }

    // Create  a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(_accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
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
                  EmailInput(
                    setEmail: (email) {
                      emailAddress = email;
                    },
                  ),
                  PasswordInput(
                    label: 'Password',
                    hintText: 'Create Password',
                    setPassword: (pass) {
                      password = pass;
                    },
                  ),
                  // LOGIN button
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: login,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(18),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: OutlinedButton(
                      onPressed: signInWithGoogle,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Sign-In with Google',
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: OutlinedButton(
                      onPressed: signInWithFacebook,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Sign-In with Facebook',
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
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
