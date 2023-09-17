import 'package:flutter/material.dart';
import 'package:mytodo_app/provider/todo_provider.dart';


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
    
    // final TodoProvider = Provider.of<TodoProvider=>(context, listen: true);
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
                  const TextField(
                    decoration: InputDecoration(),
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
        title: const Text('My todo app'),
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
                    Text('Due Task'),
                    Text('completed'),
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


