import 'package:flutter/material.dart';
import 'package:mytodo_app/models/todo_model.dart';
import 'package:mytodo_app/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({super.key});

  @override
  State<MyTodoApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyTodoApp> {
  late TodoProvider provider;
  @override
  void initState() {
    super.initState();

    provider = Provider.of<TodoProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                children: [
                  Selector<TodoProvider, List<TodoModel>>(
                    selector: (p0, p1) => p1.todolists,
                    builder: (context, text, child) {
                      return const ListTile(
                        title: TextField(),
                        
                      );
                      
                    },
                    // child: const TextField(
                    //   decoration: InputDecoration(),
                    // ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add'),
                    
                  )
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.add_circle_outline,
          color: Colors.blue,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 22),
          child: Text(
            'My todo app',
          ),
        ),
      ),
      body: const Column(
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabBar(
                  tabs: [
                    Text(
                      'Due Task',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'completed',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 270),
                  child: Icon(
                    Icons.add_box_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'No Task left',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
