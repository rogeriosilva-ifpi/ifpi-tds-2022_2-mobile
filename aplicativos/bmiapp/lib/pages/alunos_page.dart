import 'package:bmiapp/models/nota.dart';
import 'package:bmiapp/pages/components/item_nota.dart';
import 'package:bmiapp/pages/components/my_primary_button.dart';
import 'package:flutter/material.dart';

class AlunosPage extends StatefulWidget {
  const AlunosPage({super.key});

  @override
  State<AlunosPage> createState() => _AlunosPageState();
}

class _AlunosPageState extends State<AlunosPage> {
  final nameController = TextEditingController();
  final nota1Controller = TextEditingController();
  final nota2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final List<Nota> notas = [
    Nota(nome: "Madalena Silva", nota1: 4.5, nota2: 9.1)
  ];

  void _addNovaNota() {
    if (_formKey.currentState!.validate()) {
      final nota = Nota(
        nome: nameController.text,
        nota1: double.parse(nota1Controller.text),
        nota2: double.parse(nota2Controller.text),
      );

      notas.add(nota);

      _resetDados();

      // Atualizar a UI com novos dados.
      setState(() {});
    }
  }

  _populateForm(int index) {
    nameController.text = notas[index].nome;
    nota1Controller.text = notas[index].nota1.toString();
    nota2Controller.text = notas[index].nota2.toString();
  }

  void _resetDados() {
    nameController.clear();
    nota1Controller.clear();
    nota2Controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Dados',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      shadows: [
                        Shadow(
                          color: Colors.blueGrey,
                          offset: Offset(-2, -2),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor informe seu nome';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.account_balance_outlined,
                        color: Colors.deepPurple,
                      ),
                      labelText: 'Digite o nome do aluno',
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: nota1Controller,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor informe a nota 1.';
                            }

                            try {
                              double.parse(value);
                            } catch (e) {
                              return 'Valor inválido!';
                            }

                            return null;
                          }),
                          decoration: const InputDecoration(
                            labelText: 'Nota 1:',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: nota2Controller,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor informe a nota 1.';
                            }

                            return null;
                          }),
                          decoration: const InputDecoration(
                            labelText: 'Nota 2:',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  MyPrimaryButton(
                    label: 'Salvar Nota',
                    onPressed: _addNovaNota,
                  ),
                  TextButton(
                    onPressed: _resetDados,
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('Notas Cadastradas'),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: notas.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key('$index'),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 10),
                      child: const Icon(Icons.delete_forever),
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _populateForm(index),
                      child: ItemNota(
                        name: notas[index].nome,
                        nota1: notas[index].nota1,
                        nota2: notas[index].nota2,
                        media: notas[index].media,
                      ),
                    ),
                    onDismissed: (direction) {
                      notas.removeAt(index);
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          elevation: 5,
                          backgroundColor: Colors.purpleAccent,
                          duration: Duration(seconds: 2),
                          content: Text('Nota Removida!'),
                        ),
                      );
                    },
                  );
                },
                // shrinkWrap: true,
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('App Alunos'),
      ),
    );
  }
}
