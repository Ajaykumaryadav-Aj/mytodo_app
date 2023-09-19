import 'package:flutter/material.dart';
import 'package:mytodo_app/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> todoTaskList = [
    TodoModel(text: 'text', isDone: true),
    TodoModel(text: 'hhh', isDone: false),
  ];

  void addTask(String task) {
    todoTaskList.add(
      TodoModel(
        text: task,
      ),
    );
  }
}
