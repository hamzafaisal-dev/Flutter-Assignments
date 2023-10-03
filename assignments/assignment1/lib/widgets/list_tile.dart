import 'package:assignment1/models/comments.dart';
import 'package:flutter/material.dart';

class CommentListTile extends StatelessWidget {
  const CommentListTile({
    super.key,
    required this.comment,
  });

  final Comments comment;

  void showDetailsModal(context, comment) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Name: ${comment.name}\nEmail: ${comment.email}\nBody: ${comment.body}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[800],
          child: Text(
            comment.id.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(comment.name),
        onTap: () {
          showDetailsModal(context, comment);
        },
      ),
    );
  }
}
