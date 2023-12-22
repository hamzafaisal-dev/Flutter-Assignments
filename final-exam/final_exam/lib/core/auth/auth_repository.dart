import 'package:final_exam/core/auth/auth_network.dart';
import 'package:final_exam/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  UserFirebaseClient userFirebaseClient;

  AuthRepository({required this.userFirebaseClient});

  Stream<User?> userStateChangeStream() {
    return userFirebaseClient.userAuthChangeStream;
  }

  Future<UserModel?> getCurrentUser(User? user) {
    return userFirebaseClient.getCurrentUser(user);
  }

  Future<UserCredential> handleLogin(String email, String password) async {
    return await userFirebaseClient.handleLogin(email, password);
  }

  Future<void> handleSignUp(String name, String email, String password) async {
    return await userFirebaseClient.handleSignUp(name, email, password);
  }

  void signOut() async {
    await userFirebaseClient.signOut();
  }
}
