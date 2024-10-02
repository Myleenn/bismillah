// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on _TodoStore, Store {
  late final _$todoListAtom =
      Atom(name: '_TodoStore.todoList', context: context);

  @override
  ObservableList<TodoItem> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableList<TodoItem> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  late final _$_TodoStoreActionController =
      ActionController(name: '_TodoStore', context: context);

  @override
  void addTodoItem(String task) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.addTodoItem');
    try {
      return super.addTodoItem(task);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodoItem(int index) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.removeTodoItem');
    try {
      return super.removeTodoItem(index);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTodoItem(int index) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.toggleTodoItem');
    try {
      return super.toggleTodoItem(index);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoList: ${todoList}
    ''';
  }
}
