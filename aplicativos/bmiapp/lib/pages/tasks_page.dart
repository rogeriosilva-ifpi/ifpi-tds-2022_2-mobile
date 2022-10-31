import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final taskController = TextEditingController();

  // final List<String> tasks = [];
  final nomes = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Nova Tarefa',
              ),
            ),
            Card(
              color: Colors.cyan,
              child: TextButton(
                onPressed: () {
                  nomes.add(taskController.text);
                  taskController.clear();
                  setState(() {});
                },
                child: const Text(
                  'ADICIONAR',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: nomes.length,
                itemBuilder: (_, i) {
                  return ListTile(
                    title: Text(nomes[i]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
