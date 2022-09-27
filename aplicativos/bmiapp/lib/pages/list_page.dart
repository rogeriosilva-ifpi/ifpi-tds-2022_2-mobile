import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List App'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: const [
          Card(
            color: Colors.amber,
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.battery_1_bar),
              title: Text('Ana Helem'),
              trailing: Icon(
                Icons.star,
                color: Colors.pinkAccent,
              ),
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.anchor),
              title: Text('Fca Ranieli'),
              trailing: Icon(Icons.star_border),
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Erica Pieroté'),
              trailing: Icon(Icons.star_border),
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('Bruna Silva'),
              trailing: Icon(Icons.star_border),
            ),
          ),
        ],
      ),
    );
  }
}
