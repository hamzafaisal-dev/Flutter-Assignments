import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserFirebaseClient {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  UserFirebaseClient({
    required this.firebaseAuth,
    required this.firestore,
  });

  Stream<User?> get userAuthChangeStream => firebaseAuth.userChanges();

  // get current user
  Future<UserModel?> getCurrentUser(User? currentUser) async {
    String? currentUserId = currentUser?.uid;

    if (currentUserId == null) return null;

    DocumentSnapshot querySnapshot =
        await firestore.collection('users').doc(currentUserId).get();

    Map<String, dynamic> userMap = querySnapshot.data() as Map<String, dynamic>;

    UserModel user = UserModel.fromMap(userMap);

    return user;
  }

  // email and pass login
  Future<UserCredential> handleLogin(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  // email and pass sign up
  Future<void> handleSignUp(String name, String email, String password) async {
    final newUserCredentials =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String userId = newUserCredentials.user!.uid;

    // UserModel newUser = UserModel(
    //   userId: userId,
    //   role: 'user',
    //   name: name,
    //   email: email,
    //   postedResources: [],
    //   savedResources: [],
    //   likedResources: [],
    //   dislikedResources: [],
    //   points: 0,
    //   reportCount: 0,
    //   isBanned: false,
    //   createdAt: DateTime.now(),
    //   updatedAt: null,
    //   isActive: true,
    //   isDeleted: false,
    // );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(newUserCredentials.user!.uid)
        .set({"userId": userId, "userName": name, "email": email});
  }

  // sign out
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
