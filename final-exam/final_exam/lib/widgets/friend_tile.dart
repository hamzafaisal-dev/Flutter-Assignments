import 'package:final_exam/models/friends_model.dart';
import 'package:final_exam/screens/add_screen.dart';
import 'package:flutter/material.dart';

class FriendTile extends StatefulWidget {
  const FriendTile({
    super.key,
    required this.friend,
    required this.onDelete,
  });

  final FriendModel friend;
  final void Function() onDelete;

  @override
  State<FriendTile> createState() => _FriendTileState();
}

class _FriendTileState extends State<FriendTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(
                friend: widget.friend,
              ),
            ),
          );
        },
        leading: const CircleAvatar(radius: 30),
        title: Text(widget.friend.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.friend.email),
            Text(widget.friend.contactNumber)
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            widget.onDelete();
          },
          icon: const Icon(Icons.delete),
          iconSize: 26,
        ),
      ),
    );
  }
}
