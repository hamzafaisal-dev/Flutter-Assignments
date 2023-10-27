import 'package:flutter/material.dart';
import 'package:midterm/provider_class.dart';
import 'package:midterm/widgets/products_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderClass(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Products'),
          ),
          body: const ProductsList(),
        ),
      ),
    );
  }
}
