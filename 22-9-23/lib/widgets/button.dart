import 'package:flutter/material.dart';

class FlutterButton extends StatelessWidget {
  const FlutterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              onPressed: () {
                print('Elevated buttton');
              },
              child: const Text('Elevated'),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: FilledButton(
              onPressed: () {
                print('Filled button');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Filled'),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton.tonal(
                  onPressed: () {
                    print('Filled tonal');
                  },
                  // style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Filled tonal'),
                ),
                FilledButton.tonalIcon(
                  onPressed: () {
                    print('Filled tonal');
                  },
                  label: const Text('Filled icon'),
                  // style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          SizedBox(
            child: TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
          ),
          InkWell(
            onTap: () {
              print('SIMPLE TEXT PRESSED');
            },
            child: const SizedBox(
              child: Text('PRESS ME'),
            ),
          )
        ],
      ),
    );
  }
}
