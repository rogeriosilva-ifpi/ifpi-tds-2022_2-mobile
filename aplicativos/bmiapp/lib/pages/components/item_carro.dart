import 'package:bmiapp/models/carro.dart';
import 'package:flutter/material.dart';

class ItemCarro extends StatelessWidget {
  final Carro carro;
  // final Function(Nota nota) onTap;
  // final Function(Nota nota) onDismissed;

  const ItemCarro({
    Key? key,
    required this.carro,
    // required this.onTap,
    // required this.onDismissed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 10),
        child: const Icon(Icons.heart_broken),
      ),
      // onDismissed: (direction) => onDismissed(carro),
      child: Card(
        child: InkWell(
          onTap: () {
            // onTap(carro);
          },
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.car_rental, color: Colors.blue),
              ],
            ),
            title: Text(
              carro.nome,
              style: const TextStyle(fontSize: 14),
            ),
            subtitle: Row(
              children: [
                Text(
                  carro.nome,
                  style: const TextStyle(
                    fontSize: 10,
                    // color: nota1 >= 7 ? Colors.blue : Colors.red,
                  ),
                )
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${carro.id}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'ID',
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
