import 'package:flutter/material.dart';

class CustomGridTile extends StatefulWidget {
  const CustomGridTile({super.key});

  @override
  State<CustomGridTile> createState() => _CustomGridTileState();
}

class _CustomGridTileState extends State<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
              // backgroundImage: NetworkImage(''),
              ),
          ListTile(
            title: Text(
              'Person',
              textAlign: TextAlign.center,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('abc@yahoo.comssss'),
                Text('+923332256193'),
              ],
            ),
          ),
          Icon(Icons.delete),
        ],
      ),
    );
  }
}
