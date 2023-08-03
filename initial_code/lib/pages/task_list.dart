import 'package:flutter/material.dart';

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
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      // Add any content you want inside the Card widget.
                      // For example, you can add a title or description for the tasks.
                      Text('Task List', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Here are your tasks:'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Card(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Task $index'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Add any functionality you want when tapping the ListTile.
                      },
                    );
                  },
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
