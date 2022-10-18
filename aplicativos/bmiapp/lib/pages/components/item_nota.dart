import 'package:flutter/material.dart';

class ItemNota extends StatelessWidget {
  final String name;
  final double nota1;
  final double nota2;
  final double media;

  const ItemNota({
    Key? key,
    required this.name,
    required this.nota1,
    required this.nota2,
    required this.media,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.stadium, color: media >= 7 ? Colors.blue : Colors.red),
          ],
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 14),
        ),
        subtitle: Row(
          children: [
            Text(
              'Nota 1: ${nota1.toStringAsFixed(1)}',
              style: const TextStyle(
                fontSize: 10,
                // color: nota1 >= 7 ? Colors.blue : Colors.red,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Nota 2: ${nota2.toStringAsFixed(1)}',
              style: const TextStyle(
                fontSize: 10,
                // color: nota2 >= 7 ? Colors.blue : Colors.red,
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              media.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: media >= 7 ? Colors.black : Colors.red,
              ),
            ),
            const Text(
              'Média',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
