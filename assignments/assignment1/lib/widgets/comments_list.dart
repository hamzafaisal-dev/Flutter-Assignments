import 'dart:convert';

import 'package:assignment1/models/comments.dart';
import 'package:assignment1/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Comments>> fetchComments() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/comments'),
  );

  if (response.statusCode == 200) {
    // converts stringified res body to JSON
    List<dynamic> parsedListJson = jsonDecode(response.body);

// map function always returns an Iterable.
// .from() is a constructor given by List. It takes in an Iterable as param and returns a List. It iterates over each item in iterable and adds them to the newly created List
// List<Comments> ensures that this List will only contain elements of type Comments
    List<Comments> commentsList = List<Comments>.from(
      parsedListJson.map(
        (dynamic comment) => Comments.fromJson(comment),
      ),
    );

    return commentsList;
  } else {
    throw Exception('Error loading comments');
  }
}

class CommentsList extends StatefulWidget {
  const CommentsList({super.key});

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  //late keyword tells Flutter that there is no initial value for this variable but it will have a value before it is used for the first time
  late Future<List<Comments>> _loadedComments;

  @override
  void initState() {
    super.initState();

    // fetch data once upon initial render and store for future use
    _loadedComments = fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Comments',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: _loadedComments,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Error loading data',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => CommentListTile(
                comment: snapshot.data![index],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
