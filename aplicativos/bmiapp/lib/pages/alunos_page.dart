import 'package:bmiapp/database/database_helper.dart';
import 'package:bmiapp/models/nota.dart';
import 'package:bmiapp/pages/components/form_title.dart';
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

  late Nota _nota;
  var isEditing = false;

  final List<Nota> notas = [
    // Nota(nome: "Madalena Silva", nota1: 4.5, nota2: 9.1)
  ];

  late final DatabaseHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    dbHelper.initDB().whenComplete(() => setState(() {}));
  }

  Future<void> _saveNota() async {
    if (_formKey.currentState!.validate()) {
      if (!isEditing) {
        final nota = Nota(
          nome: nameController.text,
          nota1: double.parse(nota1Controller.text),
          nota2: double.parse(nota2Controller.text),
        );

        dbHelper.addNota(nota);
        // notas.add(nota);
      } else {
        _nota.nome = nameController.text;
        _nota.nota1 = double.parse(nota1Controller.text);
        _nota.nota2 = double.parse(nota2Controller.text);
        isEditing = false;
        await dbHelper.updateNota(_nota);
      }

      _resetDados();

      // Atualizar a UI com novos dados.
      setState(() {});
    }
  }

  void _removeNota(Nota nota) {
    dbHelper.deleteNota(nota);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        elevation: 5,
        backgroundColor: Colors.purpleAccent,
        duration: Duration(seconds: 2),
        content: Text('Nota Removida!'),
      ),
    );
    setState(() {});
  }

  _populateForm(Nota nota) {
    isEditing = true;
    _nota = nota;
    nameController.text = _nota.nome;
    nota1Controller.text = _nota.nota1.toString();
    nota2Controller.text = _nota.nota2.toString();

    setState(() {});
  }

  void _resetDados() {
    nameController.clear();
    nota1Controller.clear();
    nota2Controller.clear();

    isEditing = false;

    setState(() {});
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
                  const FormTitle(
                    title: 'Dados',
                  ),
                  const FormTitle(
                    title: 'do Aluno',
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
                    label: isEditing ? 'Atualizar nota' : 'Salvar nota',
                    onPressed: _saveNota,
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
              child: FutureBuilder<List<Nota>>(
                future: dbHelper.db != null ? dbHelper.getAllNotas() : null,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final nota = snapshot.data![index];
                      return ItemNota(
                        nota: nota,
                        onTap: _populateForm,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('App Alunos'),
      ),
    );
  }
}
