import 'package:flutter/material.dart';
import 'package:midterm/widgets/products_list.dart';

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
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(Icons.menu),
          title: const Text('Midterm'),
        ),
        body: const ProductsList(),
      ),
    );
  }
}
