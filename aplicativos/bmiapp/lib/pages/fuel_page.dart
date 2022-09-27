import 'package:flutter/material.dart';

class FuelPage extends StatelessWidget {
  FuelPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final destinationController = TextEditingController();
  final distanceController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fuel App',
          style: TextStyle(fontSize: 16.0),
        ),
        actions: [
          IconButton(
            onPressed: () {
              const snackBar = SnackBar(
                content: Text('App calculate travel fuel!'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(Icons.info_outline),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Fuel Calculator"),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: destinationController,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Destino',
                  ),
                ),
                TextFormField(
                  controller: distanceController,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Distância',
                  ),
                ),
                TextFormField(
                  controller: valueController,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Valor (L)',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text;
                    final destination = destinationController.text;
                    final distance = double.parse(distanceController.text);
                    final valueL = double.parse(valueController.text);

                    final totalDistance = distance * 2;
                    final quantityL = totalDistance / 12;
                    final totalValue = quantityL * valueL;

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                                "Você percorrerá ${totalDistance}Km e gastará R\$ ${totalValue.toStringAsFixed(2)}"),
                          );
                        });
                  },
                  child: const Text('Calcular Valor R\$'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
