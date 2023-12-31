import 'package:flutter/material.dart';
import 'package:mytodo_app/models/todo_model.dart';
import 'package:mytodo_app/provider/todo_provider.dart';
import 'package:provider/provider.dart';

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
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Enter Your Task',
                      style: TextStyle(
                          color: Color.fromRGBO(116, 116, 116, 1),
                          fontSize: 19),
                    ),
                  ),
                  Selector<TodoProvider, List<TodoModel>>(
                    selector: (p0, p1) => p1.dueTask,
                    builder: (context, text, child) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                          controller: textController,
                          decoration: const InputDecoration(
                            constraints: BoxConstraints(maxHeight: 59),
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                              // borderSide: BorderSide(),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  FloatingActionButton.extended(
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(255, 51, 51, 87),
                    onPressed: () {
                      provider.addTask(TodoModel(text: textController.text));
                      textController.clear();
                      Navigator.pop(context);
                    },
                    label: const Row(
                      children: [
                        Text(
                          'Add',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Icon(
                          Icons.add_circle_outline_rounded,
                          color: Color.fromARGB(255, 106, 52, 243),
                        ),
                      ],
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
      body: Column(
        children: [
          Selector<TodoProvider, List<TodoModel>>(
            selector: (p0, p1) => p1.dueTask,
            builder: (context, value, child) => value.isEmpty
                ? const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 260),
                    child: Column(
                      children: [
                        Icon(
                          Icons.add_box_outlined,
                          color: Colors.grey,
                          size: 100,
                        ),
                        Text(
                          'No task left',
                          style: TextStyle(color: Colors.grey, fontSize: 19),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.dueTask.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 16,
                        right: 16,
                      ),
                      child: ListTile(
                        onTap: () {},
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        tileColor: const Color.fromRGBO(97, 94, 255, 1),
                        title: Text(
                          provider.dueTask[index].text,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            provider.toggle(value[index]);

                            setState(() {});
                          },
                          icon: Icon(
                            provider.dueTask[index].isDone
                                ? Icons.check_box_outlined
                                : Icons.check_box_outline_blank,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
