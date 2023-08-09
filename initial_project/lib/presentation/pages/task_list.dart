import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TaskList extends StatefulWidget {
  final String username;
  
  const TaskList({Key? key, required this.username}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late String username;
  List<String> tasks = []; // Add this line to declare and initialize the tasks list

  @override
  void initState() {
    super.initState();
    getUsernameFromSharedPreferences();
    loadTasks();
  }

  void getUsernameFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString(widget.username) ?? ''; // Pode usar um valor padrão aqui se desejar
    });
  }

  void loadTasks() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    // ignore: unnecessary_brace_in_string_interps
    tasks = prefs.getStringList('tasks_${username}') ?? []; // Carregar tarefas salvas ou lista vazia se não houver nenhuma
  });
}

void saveTasks() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // ignore: unnecessary_brace_in_string_interps
  prefs.setStringList('tasks_${username}', tasks); // Salvar a lista de tarefas usando a chave do nome de usuário
}


  void addTask(String taskName) {
    setState(() {
      tasks.add(taskName);
      saveTasks(); // Salvar a lista de tarefas após adicionar uma nova tarefa
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
      saveTasks(); // Salvar a lista de tarefas após remover uma tarefa
    });
  }

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
                    MaterialPageRoute(builder: (context) => TaskRegister(addTask)),
                  );
                },
                child: const Icon(Icons.add),
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
                      title: Text(tasks[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              removeTask(index);
                            },
                          ),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                      onTap: () {
                        // Adicione qualquer funcionalidade que desejar ao tocar no ListTile.
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tasks.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskRegister extends StatelessWidget {
  final Function(String) addTask;
  final TextEditingController _taskNameController = TextEditingController();

  // ignore: use_key_in_widget_constructors
  TaskRegister(this.addTask);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _taskNameController,
              decoration: const InputDecoration(labelText: 'Task Name'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String taskName = _taskNameController.text;
                if (taskName.isNotEmpty) {
                  addTask(taskName);
                }
                Navigator.pop(context);
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
