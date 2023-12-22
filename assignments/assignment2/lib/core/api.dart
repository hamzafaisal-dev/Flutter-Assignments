import 'dart:convert';

import 'package:assignment2/core/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Future<User> getUser() async {
    final http.Response response = await _client.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    );
    final parsed = jsonDecode(response.body)[0];
    final user = User.fromJson(parsed);

    return user;
  }
}
