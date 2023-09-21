import 'package:flutter/material.dart';
import 'package:mytodo_app/provider/todo_provider.dart';
import 'package:mytodo_app/screen/complete_screen.dart';
import 'package:mytodo_app/screen/due_task_screen.dart';
import 'package:provider/provider.dart';

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({super.key});

  @override
  State<MyTodoApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyTodoApp> {
  final textController = TextEditingController();
  late TodoProvider provider;
  @override
  void initState() {
    super.initState();

    provider = Provider.of<TodoProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(97, 94, 255, 1),
          // toolbarHeight: 70,
          title: const Text(
            'My todo app',
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: [
              Text(
                'Due Task',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Complete Task',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DuetaskScreen(),
            CompleteScreen(),
          ],
        ),
      ),
    );
  }
}
