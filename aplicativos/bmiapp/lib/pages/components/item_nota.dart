import 'package:flutter/material.dart';

import '../../models/nota.dart';

class ItemNota extends StatelessWidget {
  final Nota nota;
  final Function(Nota nota) onTap;
  final Function(Nota nota) onDismissed;

  const ItemNota(
      {Key? key,
      required this.nota,
      required this.onTap,
      required this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 10),
        child: const Icon(Icons.delete_forever),
      ),
      onDismissed: (direction) => onDismissed(nota),
      child: Card(
        child: InkWell(
          onTap: () {
            onTap(nota);
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
      ),
    );
  }
}
