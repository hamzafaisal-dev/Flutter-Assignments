import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz1/models/product_model.dart';
import 'package:quiz1/widgets/product_tile.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(
    Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
  );

  if (response.statusCode == 200) {
    // converts stringified res body to JSON
    List<dynamic> parsedListJson = jsonDecode(response.body);

// map function always returns an Iterable.
// .from() is a constructor given by List. It takes in an Iterable as param and returns a List. It iterates over each item in iterable and adds them to the newly created List
// List<Comments> ensures that this List will only contain elements of type Comments
    List<Product> productsList = List<Product>.from(
      parsedListJson.map(
        (dynamic product) => Product.fromJson(product),
      ),
    );

    return productsList;
  } else {
    throw Exception('Error loading comments');
  }
}

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  //late keyword tells Flutter that there is no initial value for this variable but it will have a value before it is used for the first time
  late Future<List<Product>> _loadedProducts;

  @override
  void initState() {
    super.initState();

    // fetch data once upon initial render and store for future use
    _loadedProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Products',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: _loadedProducts,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Error loading data',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var product = snapshot.data![index];
                return ProductTile(
                  name: product.name!,
                  price: product.price!,
                  imageLink: product.imageLink!,
                  description: product.description!,
                  productType: product.productType!,
                  rating: product.rating ?? 0.0,
                  productColors: product.productColors!,
                  brand: product.brand!,
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
