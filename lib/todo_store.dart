import 'package:mobx/mobx.dart';

// Include generated file
part 'todo_store.g.dart';

// Class to represent a todo item
class TodoItem {
  String task;
  bool isCompleted;

  TodoItem(this.task, {this.isCompleted = false});
}

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  ObservableList<TodoItem> todoList = ObservableList<TodoItem>();

  @action
  void addTodoItem(String task) {
    if (task.isNotEmpty) {
      todoList.add(TodoItem(task));
    }
  }

  @action
  void removeTodoItem(int index) {
    todoList.removeAt(index);
  }

  @action
  void toggleTodoItem(int index) {
    todoList[index].isCompleted = !todoList[index].isCompleted;
  }
}
