import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_exam/core/friends/friends_repository.dart';
import 'package:final_exam/models/friends_model.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  final FriendsRepository friendsRepository;

  FriendBloc({required this.friendsRepository}) : super(FriendInitial()) {
    // fetch friends
    on<FetchFriendsEvent>((event, emit) {
      try {
        emit(FriendLoading());
        Stream<List<FriendModel>> friendsList = friendsRepository.friends();
        emit(FriendsLoaded(friends: friendsList));
      } catch (error) {
        emit(FriendError(errorMessage: error.toString()));
      }
    });

    // add friend
    on<AddFriendEvent>((event, emit) async {
      try {
        emit(FriendLoading());
        await friendsRepository.addNewFriend(event.newFriend);
        emit(FriendSuccess());
      } catch (error) {
        emit(FriendError(errorMessage: error.toString()));
      }
    });

    // update friend
    on<UpdateFriendEvent>((event, emit) async {
      try {
        emit(FriendLoading());
        await friendsRepository.updateFriend(event.newFriend);
        emit(FriendSuccess());
      } catch (error) {
        emit(FriendError(errorMessage: error.toString()));
      }
    });

    // delete friend
    on<DeleteFriendEvent>((event, emit) async {
      try {
        emit(FriendLoading());
        await friendsRepository.deleteFriend(event.newFriend);
        emit(FriendSuccess());
      } catch (error) {
        emit(FriendError(errorMessage: error.toString()));
      }
    });
  }
}
