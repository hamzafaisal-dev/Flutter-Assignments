import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test/models/users.dart';

Future<List<User>> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  if (response.statusCode == 200) {
    List<dynamic> parsedListJson = jsonDecode(response.body);

    List<User> itemsList = List<User>.from(
      parsedListJson.map<User>(
        (dynamic i) => User.fromJson(i),
      ),
    );

    return itemsList;
  } else {
    throw Exception('Failed to load album');
  }
}

class ListApi extends StatefulWidget {
  const ListApi({super.key});

  @override
  State<ListApi> createState() => _ListApiState();
}

class _ListApiState extends State<ListApi> {
  Widget _customCard(User obj) {
    return Card(
      child: ListTile(
        leading: Text(
          obj.id.toString(),
          style: const TextStyle(fontSize: 15),
        ),
        title: Text(obj.title),
        trailing: const SizedBox(
          width: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.add),
              Icon(Icons.add),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Networking'),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) {
                  var obj = snapshot.data![index];
                  return _customCard(obj);
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
