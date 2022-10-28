import 'package:flutter/material.dart';

import '../../models/nota.dart';

class ItemNota extends StatelessWidget {
  final int index;
  final Nota nota;
  final Function(int) onTap;

  const ItemNota({
    Key? key,
    required this.nota,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          onTap(index);
        },
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.stadium,
                  color: nota.media >= 7 ? Colors.blue : Colors.red),
            ],
          ),
          title: Text(
            nota.nome,
            style: const TextStyle(fontSize: 14),
          ),
          subtitle: Row(
            children: [
              Text(
                'Nota 1: ${nota.nota1.toStringAsFixed(1)}',
                style: const TextStyle(
                  fontSize: 10,
                  // color: nota1 >= 7 ? Colors.blue : Colors.red,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Nota 2: ${nota.nota2.toStringAsFixed(1)}',
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
                nota.media.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: nota.media >= 7 ? Colors.black : Colors.red,
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
      ),
    );
  }
}
