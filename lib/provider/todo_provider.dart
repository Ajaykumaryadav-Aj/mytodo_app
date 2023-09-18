import 'package:flutter/material.dart';
import 'package:mytodo_app/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> todolist = [TodoModel(text: 'text')];
  List<TodoModel> get todolists => todolist.where((element) => element.isDone).toList();
}
