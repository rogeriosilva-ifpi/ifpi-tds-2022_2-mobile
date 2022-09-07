import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final nameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // const SizedBox(
                //   height: 50,
                // ),
                const Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    // fontStyle: FontStyle.italic,
                    letterSpacing: 10,
                    // backgroundColor: Colors.amber,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Favor informe seu nome!';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.account_box_outlined,
                      color: Colors.deepPurple,
                    ),
                    labelText: 'Digite seu nome',
                    // labelStyle: TextStyle(color: Colors.amber),
                    // errorStyle: TextStyle(color: Colors.blue),
                  ),
                ),
                TextFormField(
                  controller: heightController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Favor informe seu altura!';
                    }
                    final altura = double.parse(value);
                    if (altura <= 0) {
                      return 'Favor informar altura maior que 0.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Digite sua altura(m)',
                  ),
                ),
                TextFormField(
                  controller: weightController,
                  decoration: const InputDecoration(
                    labelText: 'Digite seu peso(kg)',
                    // labelStyle: TextStyle(color: Colors.red),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Favor informe seu peso!';
                    }
                    final peso = double.parse(value);
                    if (peso <= 0) {
                      return 'Favor informar peso maior que 0.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          final name = nameController.text;
                          final height = double.parse(heightController.text);
                          final weight = double.parse(weightController.text);

                          final bmi = weight / (height * height);

                          return AlertDialog(
                            title: const Text('Your BMI'),
                            content: Text(
                                'Hello $name, \n\nYour BMI is ${bmi.toStringAsFixed(1)}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('CALCULAR'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
