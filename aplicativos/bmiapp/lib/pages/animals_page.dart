import 'package:flutter/material.dart';

class AnimalsPage extends StatelessWidget {
  const AnimalsPage({super.key});

  final titles = const [
    'Lesse Silva',
    'Rabito',
    'André',
    'Cícero',
    'Cícero',
    'Cícero',
    'Cícero',
    'Cícero',
    'Cícero',
  ];

  final subtitles = const [
    'It\'s a good dog!',
    'It is my favorite dog!',
    'Little Cat!',
    'Positive little boy!',
    'Positive little boy!',
    'Positive little boy!',
    'Positive little boy!',
    'Positive little boy!',
    'Positive little boy!',
  ];

  final icons = const [
    Icons.star_border,
    Icons.favorite,
    Icons.catching_pokemon,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
  ];

  final avatars = const [
    'assets/dog1.jpeg',
    'assets/dog6.png',
    'assets/dog6.png',
    'assets/dog6.png',
    'assets/dog6.png',
    'assets/cat1.webp',
    'assets/cat1.webp',
    'assets/cat1.webp',
    'assets/cat1.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Animals List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: ListTile(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    elevation: 14.0,
                    duration: const Duration(milliseconds: 3000),
                    backgroundColor: Colors.lightBlue,
                    content: Text('Você clicou em: ${titles[index]}'),
                    behavior: SnackBarBehavior.floating,
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {},
                      textColor: Colors.white,
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(avatars[index]),
              ),
              title: Text(titles[index]),
              subtitle: Text(subtitles[index]),
              trailing: Icon(icons[index]),
            ),
          );
        },
      ),
    );
  }
}
