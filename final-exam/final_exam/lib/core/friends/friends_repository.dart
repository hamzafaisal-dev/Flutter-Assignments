import 'package:final_exam/core/friends/friends_network.dart';
import 'package:final_exam/models/final_models/expense_model.dart';
import 'package:final_exam/models/final_models/transaction_model.dart';
import 'package:final_exam/models/friends_model.dart';

class FriendsRepository {
  FriendsFirebaseClient friendsFirebaseClient;

  FriendsRepository({required this.friendsFirebaseClient});

  Future<ExpenseModel> fetchExpense() async {
    return await friendsFirebaseClient.fetchExpense();
  }

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
