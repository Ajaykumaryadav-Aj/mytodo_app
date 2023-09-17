import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
 
  void ChangeValue(double newValue) {
    // value = newValue;
    notifyListeners();
  }
}
