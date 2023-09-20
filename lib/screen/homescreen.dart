import 'package:flutter/material.dart';
import 'package:mytodo_app/models/todo_model.dart';
import 'package:mytodo_app/provider/todo_provider.dart';
import 'package:mytodo_app/screen/complete_screen.dart';
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

class DuetaskScreen extends StatefulWidget {
  const DuetaskScreen({
    super.key,
  });

  @override
  State<DuetaskScreen> createState() => _DuetaskScreenState();
}

class _DuetaskScreenState extends State<DuetaskScreen> {
  final textController = TextEditingController();

  late TodoProvider provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<TodoProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.90),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
            context: context,
            builder: (context) {
              return Column(
                children: [
                  const Text(
                    'Enter Your Task',
                    style: TextStyle(
                      color: Color.fromRGBO(116, 116, 116, 1),
                    ),
                  ),
                  Selector<TodoProvider, List<TodoModel>>(
                    selector: (p0, p1) => p1.todoTaskList,
                    builder: (context, text, child) {
                      return ListTile(
                        title: TextField(
                          controller: textController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    // style: ButtonStyle(backgroundColor: ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(40, 70, 145, 1),
                    ),
                    onPressed: () {
                      provider.addTask(TodoModel(text: textController.text));
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              );
            },
          );
        },
        child: Container(
          height: 57,
          width: 57,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(93, 158, 200, 1),
                  Color.fromRGBO(97, 93, 240, 1),
                  // Color.fromRGBO(145, 142, 255, 1),
                  Color.fromRGBO(97, 93, 240, 1),
                  // Color.fromRGBO(255, 255, 255, 1),
                  // Color.fromRGBO(255, 255, 255, 0),
                ],
              ),
              shape: BoxShape.circle),
          child: const Icon(Icons.add_circle_outline_rounded,
              color: Color.fromRGBO(41, 179, 253, 1)),
        ),
      ),
      body: Selector<TodoProvider, List<TodoModel>>(
        selector: (p0, p1) => p1.todoTaskList,
        builder: (context, value, child) => ListView.builder(
          itemCount: provider.todoTaskList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              onTap: () {},
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              tileColor: const Color.fromRGBO(97, 94, 255, 1),
              title: Text(
                provider.todoTaskList[index].text,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                onPressed: () {
                  provider.addToggle(TodoModel(text: ''));
                  setState(() {});
                },
                icon: Icon(
                  provider.todoTaskList[index].isDone
                      ? Icons.check_box_outline_blank_rounded
                      : Icons.check_box_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
