part of 'friend_bloc.dart';

abstract class FriendState {}

final class FriendInitial extends FriendState {}

final class FriendLoading extends FriendState {}

final class FriendsLoaded extends FriendState {
  final Stream<List<FriendModel>> friends;

  FriendsLoaded({required this.friends});
}

final class FriendSuccess extends FriendState {}

final class FriendError extends FriendState {
  final String errorMessage;

  FriendError({required this.errorMessage});
}
