import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'todo_store.dart'; // Import store MobX

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List with MobX',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TodoStore _todoStore = TodoStore();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List with MobX'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Add a new task',
                labelStyle: TextStyle(color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.deepPurple.shade50,
                prefixIcon: Icon(Icons.task, color: Colors.deepPurple),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                ),
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: _todoStore.todoList.length,
                itemBuilder: (context, index) {
                  final todoItem = _todoStore.todoList[index];
                  return ListTile(
                    title: Text(
                      todoItem.task,
                      style: TextStyle(
                        decoration: todoItem.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    leading: Checkbox(
                      value: todoItem.isCompleted,
                      onChanged: (value) {
                        _todoStore.toggleTodoItem(index);
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        _todoStore.removeTodoItem(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple, // Set background color to purple
        child: Icon(Icons.add), // Add icon
        onPressed: () {
          _todoStore.addTodoItem(_textController.text); // Add the task
          _textController.clear(); // Clear the text field
        },
      ),
    );
  }
}
