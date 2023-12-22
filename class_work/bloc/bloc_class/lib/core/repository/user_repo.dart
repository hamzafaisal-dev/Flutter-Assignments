import 'package:bloc_class/core/repository/network.dart';
import 'package:bloc_class/models/user_model.dart';

class UserRepository {
  final UserApiClient userApiClient;

  UserRepository({required this.userApiClient});

  Future<List<User>> getuser() async {
    return userApiClient.fetchuser();
  }

  Future<List<User>> getUserMoc() async {
    return userApiClient.fetchUserMoc();
  }
}
