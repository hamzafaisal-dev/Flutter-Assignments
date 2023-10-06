import 'package:class_work/widgets/grid_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordHidden = true;
  bool changeView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ryan Gosling'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            const SizedBox(
              height: 88.0,
            ),
            Column(
              children: [
                Image.asset(
                  'lib/assets/literally_me.jpg',
                  scale: 25,
                ),
                const SizedBox(height: 16.0),
                const Text('LOGIN'),
              ],
            ),
            const SizedBox(height: 120.0),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordHidden = !passwordHidden;
                    });
                  },
                  icon: Icon(
                      passwordHidden ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              obscureText: passwordHidden,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CardsGrid(),
                      ),
                    );
                  },
                  child: const Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
