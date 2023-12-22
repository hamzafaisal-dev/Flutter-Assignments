import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/models/final_models/expense_model.dart';
import 'package:final_exam/models/final_models/transaction_model.dart';
import 'package:final_exam/models/friends_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FriendsFirebaseClient {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  FriendsFirebaseClient({
    required this.firebaseAuth,
    required this.firestore,
  });

  Future<ExpenseModel> fetchExpense() async {
    final expensesCollection = firestore.collection('expenses');

    QuerySnapshot docSnapshot = await expensesCollection.limit(1).get();
    print('we here');

    // Get the first document in the QuerySnapshot
    QueryDocumentSnapshot doc = docSnapshot.docs.first;

    // Call the data() method on the document to get a Map<String, dynamic>
    final transactionMap = doc.data() as Map<String, dynamic>;

    ExpenseModel expense = ExpenseModel.fromMap(transactionMap);

    return expense;
  }

  Future<void> addNewFriend(FriendModel friend) {
    final friendsCollection = firestore.collection('friends');

    return friendsCollection.add(friend.toMap());
  }

  Future<void> deleteFriend(FriendModel friend) async {
    final friendsCollection = firestore.collection('friends');

    final friendDocument = await friendsCollection
        .where('friendId', isEqualTo: friend.friendId)
        .get();

    if (friendDocument.docs.isNotEmpty) {
      await friendsCollection.doc(friendDocument.docs.first.id).delete();
    }

    print('brother deleted');
  }

  Stream<List<FriendModel>> friends() {
    final friendsCollection = firestore.collection('friends');

    return friendsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final Map<String, dynamic> data = doc.data();

        print(data);

        return FriendModel.fromMap(data);
      }).toList();
    });
  }

  Future<void> updateFriend(FriendModel updateFriend) async {
    final friendsCollection = firestore.collection('friends');

    final friendDocument = await friendsCollection
        .where('friendId', isEqualTo: updateFriend.friendId)
        .get();

    if (friendDocument.docs.isNotEmpty) {
      await friendsCollection
          .doc(friendDocument.docs.first.id)
          .update(updateFriend.toMap());
    }
  }
}
