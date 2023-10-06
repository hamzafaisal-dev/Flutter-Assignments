import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  'lib/assets/literally_me.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 4,
                  ),
                  child: Text(title),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
