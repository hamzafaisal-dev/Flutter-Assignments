import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midterm/models/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<Products>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    var productsData = json.decode(response.body)['products'] as List;
    List<Products> productsList = productsData
        .map(
          (product) => Products.fromJson(product),
        )
        .toList();
    return productsList;
  } else {
    throw Exception('Failed to load products');
  }
}

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  late Future<List<Products>> products;

  void openModal(context, product) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...product.images.map(
                    (image) => Image.network(
                      image,
                      fit: BoxFit.cover,
                      scale: 2.5,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 20,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(product.description),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "\$${product.price}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(product.rating.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text("${product.discountPercentage}%"),
                    const Icon(
                      Icons.discount,
                      color: Colors.blue,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
          );
        }

        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var product = snapshot.data![index];
              return Card(
                color: Colors.lightBlue[100],
                child: Container(
                  child: Column(
                    children: [
                      // Container(
                      //   child: Image.network(
                      //     product.thumbnail!,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      FittedBox(
                        fit: BoxFit.fill,
                        child: Image.network(
                          product.thumbnail!,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text('${product.price} USD'),
                              const SizedBox(width: 5),
                              IconButton(
                                onPressed: () {
                                  openModal(context, product);
                                },
                                icon: const Icon(Icons.remove_red_eye_sharp),
                              )
                            ],
                          )
                        ],
                      ),

                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: Text(product.description!),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
