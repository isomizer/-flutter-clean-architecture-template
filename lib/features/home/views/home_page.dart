import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main_app/app_widget.dart';

class TodoItem {
  final String title;
  final String description;
  final int priority;

  TodoItem({required this.title, required this.description, required this.priority});
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoItem> todoItems = [
 TodoItem(title: 'Buy groceries', description: 'Milk, bread, eggs', priority: 2),
    TodoItem(title: 'Do laundry', description: 'Wash clothes and sheets', priority: 1),
    TodoItem(title: 'Clean house', description: 'Vacuum, dust, mop', priority: 3),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            onPressed: () => ref.read(loggedInProvider.notifier).state = false,
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          final todoItem = todoItems[index];
          return Card(
            child: ListTile(
              title: Text(todoItem.title),
              subtitle: Text(todoItem.description),
              trailing: Text('Priority: ${todoItem.priority}'),
            ),
          );
        },
      ),
    );
  }
}
