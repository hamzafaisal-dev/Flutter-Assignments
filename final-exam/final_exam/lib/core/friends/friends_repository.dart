import 'package:final_exam/core/friends/friends_network.dart';
import 'package:final_exam/models/friends_model.dart';

class FriendsRepository {
  FriendsFirebaseClient friendsFirebaseClient;

  FriendsRepository({required this.friendsFirebaseClient});

  Future<void> addNewFriend(FriendModel friend) {
    return friendsFirebaseClient.addNewFriend(friend);
  }

  Future<void> deleteFriend(FriendModel friend) {
    return friendsFirebaseClient.deleteFriend(friend);
  }

  Stream<List<FriendModel>> friends() {
    return friendsFirebaseClient.friends();
  }

  Future<void> updateFriend(FriendModel update) {
    return friendsFirebaseClient.updateFriend(update);
  }
}
