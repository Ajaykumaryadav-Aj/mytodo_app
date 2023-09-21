import 'package:flutter/material.dart';
import 'package:mytodo_app/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> todoTaskList = [
    TodoModel(text: 'text',
         isDone: false
        ),
    TodoModel(text: 'hhh', isDone: true),
  ];

  List<TodoModel> get completeTask =>
      todoTaskList.where((element) => element.isDone).toList();

  void addTask(TodoModel value) {
    todoTaskList.add(value);
    notifyListeners();
  }

  void toggle(TodoModel value) {
    todoTaskList[todoTaskList.indexOf(value)].complete();
    // todoTaskList.remove(value);
    notifyListeners();
  }

  void removeTask(int value) {
    todoTaskList.removeAt(value);
    notifyListeners();
  }
}
