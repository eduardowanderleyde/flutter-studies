import 'package:flutter/material.dart';
import 'package:initial_code/pages/task_register.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: Card(
                color: Colors.amber,
                child: Center(
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Column(
                      children: [
                        Text('Task List', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TaskRegister()),
                    );
                },
                child: Icon(Icons.add),
              ),
            ),
            const SizedBox(height: 16),  // Adicione um espaço entre o botão e a lista de atividades.
            Expanded(
              flex: 10,
              child: Card(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Activity $index'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Adicione qualquer funcionalidade que desejar ao tocar no ListTile.
                      },
                    );
                  },
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
