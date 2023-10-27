import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midterm/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:midterm/provider_class.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

ProviderClass itemsNotifier = ProviderClass();

class _ProductsListState extends State<ProductsList> {
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

    // listen: false means that we don't need to listen to updates from the ChangeNotifier
    Provider.of<ProviderClass>(context, listen: false).getProductData();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);

    if (data.products == null) {
      return const Center(
        child: Text('Error loading products'),
      );
    }

    if (data.products != null) {
      return ListView.builder(
        itemCount: data.products!.length,
        itemBuilder: (context, index) {
          var product = data.products![index];
          return Card(
            color: Colors.lightBlue[100],
            child: Column(
              children: [
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
          );
        },
      );
    }

    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
