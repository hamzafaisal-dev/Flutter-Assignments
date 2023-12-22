import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/models/friends_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FriendsFirebaseClient {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  FriendsFirebaseClient({
    required this.firebaseAuth,
    required this.firestore,
  });

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
