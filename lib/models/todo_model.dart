class TodoModel {
  final String text;
  bool isDone;
//  final String

  TodoModel({required this.text, this.isDone = false});

  void complete() {
    isDone = !isDone;
  }
}
