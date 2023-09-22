import 'package:flutter/material.dart';
import 'package:test/widgets/button.dart';
import 'package:test/widgets/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       title: Text(widget.title),
  //       actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
  //     ),
  //     body: Container(
  //       width: MediaQuery.of(context).size.width,
  //       color: Colors.red,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         // crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           const Text(
  //             'You have pushed the button this many times:',
  //           ),
  //           const FlutterButton(),
  //           Text(
  //             '$_counter',
  //             style: Theme.of(context).textTheme.headlineMedium,
  //           ),
  //           Expanded(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 FloatingActionButton(
  //                   onPressed: _incrementCounter,
  //                   tooltip: 'Increment',
  //                   child: const Icon(Icons.add),
  //                 ),
  //                 FloatingActionButton(
  //                   onPressed: _decrementCounter,
  //                   tooltip: 'Decrement',
  //                   child: const Icon(Icons.remove),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return const CustomTile();
  }
}

// Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//         actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           child: const FlutterButton(),
//         ),
//       ),
//     );
