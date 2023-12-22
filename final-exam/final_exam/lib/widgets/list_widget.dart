import 'package:final_exam/blocs/friend/friend_bloc.dart';
import 'package:final_exam/models/friends_model.dart';
import 'package:final_exam/widgets/friend_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomList extends StatefulWidget {
  const CustomList({super.key, required this.friendsList});

  final List<FriendModel>? friendsList;

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  void _handleDelete(FriendModel friendToDelete) {
    BlocProvider.of<FriendBloc>(context).add(
      DeleteFriendEvent(newFriend: friendToDelete),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.friendsList?.length ?? 0,
      itemBuilder: (context, index) {
        FriendModel friendData = widget.friendsList![index];

        return FriendTile(
          friend: friendData,
          onDelete: () {
            _handleDelete(friendData);
          },
        );
      },
    );
  }
}
