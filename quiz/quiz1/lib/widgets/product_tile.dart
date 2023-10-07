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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 100, width: 100, child: Image.network(imageLink)),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(description),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Brand: $brand'.toUpperCase())),
                Expanded(child: Text('Price: \$$price'))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Product Type: ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: productType.toUpperCase(),
                          style: TextStyle(color: Colors.pink[100]),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: 'Rating: ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: rating.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
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
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
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
    );
  }
}
