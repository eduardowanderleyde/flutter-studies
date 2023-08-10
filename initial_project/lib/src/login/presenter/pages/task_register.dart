import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskRegister extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TaskRegister({Key? key});

  @override
  Widget build(BuildContext context) {
  
  final TextEditingController taskController = TextEditingController();

  void saveData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}
  void handleLoginButtonPressed() {
  String task = taskController.text;
  
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
              controller: taskController,
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
