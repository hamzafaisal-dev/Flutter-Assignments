part of 'friend_bloc.dart';

abstract class FriendEvent extends Equatable {}

class FetchExpensesEvent extends FriendEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FetchFriendsEvent extends FriendEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AddFriendEvent extends FriendEvent {
  final FriendModel newFriend;

  AddFriendEvent({required this.newFriend});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class DeleteFriendEvent extends FriendEvent {
  final FriendModel newFriend;

  DeleteFriendEvent({required this.newFriend});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UpdateFriendEvent extends FriendEvent {
  final FriendModel newFriend;

  UpdateFriendEvent({required this.newFriend});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
