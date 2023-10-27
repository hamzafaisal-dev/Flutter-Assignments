import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:midterm/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProviderClass extends ChangeNotifier {
  List<Products>? products;
  bool loading = false;

  getProductData() async {
    loading = true;
    products = (await fetchProducts());
    loading = false;

    notifyListeners();
  }

  Future<List<Products>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

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
}
