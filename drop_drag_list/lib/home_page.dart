import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //tile's list
  final List tilesList = [
    'Limpar a Casa',
    'Estudar Flutter',
    'Lição da Faculdade',
    'Organização',
  ];

  //reoder method
  void updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      //adjustments
      if (oldIndex < newIndex){
        newIndex --;
      }

      //get the tile are moving
      final tile = tilesList.removeAt(oldIndex);

      //place the tile
      tilesList.insert(newIndex, tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Drop List'),
      ),
      body: ReorderableListView(
        children: [
          for (final tile in tilesList)
            ListTile(
              key: ValueKey(tile),
              title: Text(tile),
            )
        ],
        onReorder: (oldIndex, newIndex) => updateMyTiles(oldIndex, newIndex),
      ),
    );
  }
}
