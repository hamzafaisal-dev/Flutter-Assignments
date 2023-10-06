import 'dart:convert';

import 'package:class_work/models/cards.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Cards>> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  if (response.statusCode == 200) {
    List<dynamic> parsedListJson = jsonDecode(response.body);

    List<Cards> cardsList = List<Cards>.from(
      parsedListJson.map<Cards>(
        (dynamic card) => Cards.fromJson(card),
      ),
    );

    return cardsList;
  } else {
    throw Exception('Failed to load data');
  }
}

class CardsGrid extends StatefulWidget {
  const CardsGrid({super.key});

  @override
  State<CardsGrid> createState() => _CardsGridState();
}

class _CardsGridState extends State<CardsGrid> {
  late Future<List<Cards>> futureCards;

  @override
  void initState() {
    super.initState();
    futureCards = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ryan Gosling'),
      ),
      body: FutureBuilder(
        future: futureCards,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/literally_me.jpg',
                        scale: 5,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                snapshot.data![index].id.toString(),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                snapshot.data![index].title,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
