import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.name,
    required this.price,
    required this.imageLink,
    required this.description,
    required this.productType,
    required this.rating,
    required this.productColors,
    required this.brand,
  });

  final String name;
  final String price;
  final String imageLink;
  final String description;
  final String productType;
  final double rating;
  final List productColors;
  final String brand;

  void showDetailsModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(child: Image.network(imageLink)),
                    Expanded(child: Text('$name\n$description'))
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Brand: $brand')),
                    Expanded(child: Text('Price: \$$price'))
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Product type: $productType')),
                    Expanded(child: Text('Rating: $rating'))
                  ],
                ),
                const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
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
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: SizedBox(
          height: 45,
          width: 45,
          child: Image.network(
            imageLink,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(name),
        trailing: Text(
          '\$ $price',
          style: const TextStyle(fontSize: 15),
        ),
        onTap: () {
          showDetailsModal(context);
        },
      ),
    );
  }
}
