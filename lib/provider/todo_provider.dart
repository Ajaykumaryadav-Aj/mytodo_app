import 'package:flutter/material.dart';
import 'package:mytodo_app/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  // List<TodoModel>
 final  _todoTaskList = [
    TodoModel(text: 'text', isDone: false),
    TodoModel(text: 'hhh', isDone: true),
  ];
  List<TodoModel> get dueTask =>
      _todoTaskList.where((element) => element.isDone == false).toList();

  List<TodoModel> get completeTask =>
      _todoTaskList.where((element) => element.isDone).toList();

  void addTask(TodoModel value) {
    _todoTaskList.add(value);
    notifyListeners();
  }
void toggle( value) {
  // final index = _todoTaskList.indexOf(value);
  // if (index != -1)
  //  {
    _todoTaskList[_todoTaskList.indexOf(value)].complete();
    _todoTaskList.removeAt(value);
    notifyListeners();
  // }
}

   void removeCompletedTasks() {
    _todoTaskList.removeWhere((task) => task.isDone);
    notifyListeners();
  }
}

