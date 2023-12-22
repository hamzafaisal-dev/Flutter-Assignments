import 'package:bloc_class/core/repository/network.dart';
import 'package:bloc_class/models/product_model.dart';

class ProductRepository {
  final UserApiClient userApiClient;

  ProductRepository({required this.userApiClient});

  Future<List<Products>> getProducts() async {
    return userApiClient.fetchProducts();
  }
}
