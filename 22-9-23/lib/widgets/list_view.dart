import 'package:flutter/material.dart';

var _data = [
  const TileData(title: 'Title 1', subTitle: 'Subtitle 1'),
  const TileData(title: 'Title 2', subTitle: 'Subtitle 2'),
  const TileData(title: 'Title 3', subTitle: 'Subtitle 3'),
];

class CustomTile extends StatelessWidget {
  const CustomTile({super.key});

  Widget _customCard(TileData obj) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(obj.title),
        subtitle: Text(obj.subTitle),
        trailing: const SizedBox(
          width: 200,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (ctx, index) {
            var obj = _data[index];
            return _customCard(obj);
          },
        ),
      ),
    );
  }
}

class TileData {
  const TileData({required this.title, required this.subTitle});

  final String title;
  final String subTitle;
}
