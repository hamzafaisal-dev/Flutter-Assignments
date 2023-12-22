import 'package:final_exam/blocs/friend/friend_bloc.dart';
import 'package:final_exam/models/friends_model.dart';
import 'package:final_exam/widgets/friend_tile.dart';
import 'package:final_exam/widgets/grid_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGrid extends StatefulWidget {
  const CustomGrid({super.key, required this.friendsList});

  final List<FriendModel>? friendsList;

  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  void _handleDelete(FriendModel friendToDelete) {
    BlocProvider.of<FriendBloc>(context).add(
      DeleteFriendEvent(newFriend: friendToDelete),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: widget.friendsList?.length ?? 0,
      itemBuilder: (context, index) {
        FriendModel friendData = widget.friendsList![index];

        return const CustomGridTile();
      },
    );
  }
}
