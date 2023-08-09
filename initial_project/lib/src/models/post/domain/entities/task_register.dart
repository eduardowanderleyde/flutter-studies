import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskRegister extends StatelessWidget {
  const TaskRegister({Key? key});

  @override
  Widget build(BuildContext context) {
  
  final TextEditingController task_controller = TextEditingController();

  void saveData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}
  void handleLoginButtonPressed() {
  String task = task_controller.text;
  
  saveData("task", task);

}
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Task'),
              controller: task_controller,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                  handleLoginButtonPressed();
                  Navigator.pop(
                  context,
                  );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
