import 'package:final_exam/blocs/sign_in/sign_in_bloc.dart';
import 'package:final_exam/constants.dart';
import 'package:final_exam/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() async {
    if (_loginFormKey.currentState!.validate()) {
      BlocProvider.of<SignInBloc>(context).add(
        SignInSubmittedEvent(
          _emailController.text,
          _passwordController.text,
        ),
      );

      _emailController.clear();
      _passwordController.clear();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state is SignInInErrorState) print(state.errorMessage);

              if (state is SignInValidState) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const AppLayout(),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Center(
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      //
                      const SizedBox(height: 28),

                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || !value.isValidEmail()) {
                            return 'Invalid email';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 28),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password should not be empty';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 28),

                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: FilledButton(
                          onPressed: _handleLogin,
                          child: const Text('Log In'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
