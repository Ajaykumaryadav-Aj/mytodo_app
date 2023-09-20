import 'package:flutter/material.dart';
import 'package:mytodo_app/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> todoTaskList = [
    TodoModel(text: 'text', isDone: false),
    TodoModel(text: 'hhh', isDone: false),
  ];

  void addTask(TodoModel value) {
    todoTaskList.add(value);
    notifyListeners();
  }

  void addToggle(TodoModel value) {
    todoTaskList[todoTaskList.indexOf(value)].complete();
    notifyListeners();
  }
}
