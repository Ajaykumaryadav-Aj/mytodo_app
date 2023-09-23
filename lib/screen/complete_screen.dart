import 'package:flutter/material.dart';
import 'package:mytodo_app/models/todo_model.dart';
import 'package:mytodo_app/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  late TodoProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<TodoProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.90),
      floatingActionButton: provider.completeTask.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                provider.todoTaskList.clear();
                setState(() {});
              },
              shape: const CircleBorder(),

              child: Container(
                height: 57,
                width: 57,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(180, 107, 107, 1),
                        Color.fromRGBO(170, 45, 45, 1),
                        // Color.fromRGBO(255, 107, 107, 1),
                        Color.fromRGBO(185, 45, 45, 1),
                        // Color.fromRGBO(255, 255, 255, 1),
                        // Color.fromRGBO(255, 255, 255, 0),
                      ],
                    ),
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.delete_outline_sharp,
                  color: Color.fromRGBO(255, 107, 107, 1),
                  size: 33,
                ),
              ),
              // color: Colors.redAccent,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 155),
                  child: FloatingActionButton(
                    shape: const CircleBorder(),
                    // backgroundColor: const Color.fromARGB(255, 8, 109, 191),
                    onPressed: () {},
                    child: Container(
                      width: 57,
                      height: 57,
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
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    right: 140,
                    top: 10,
                    left: 0,
                  ),
                  child: Text(
                    'Click to Add',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                )
              ],
            ),
      body: Selector<TodoProvider, List<TodoModel>>(
        selector: (p0, p1) => p1.todoTaskList,
        builder: (context, value, child) => ListView.builder(
          itemCount: provider.completeTask.length,
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: provider.completeTask[index].isDone
                  ? ListTile(
                      onTap: () {},
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      tileColor: const Color.fromRGBO(97, 94, 255, 1),
                      title: Text(
                        value[index].text,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          provider.toggle(
                            TodoModel(text: ''),
                          );
                          setState(() {});
                        },
                        icon: Icon(
                          provider.completeTask[index].isDone
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank_rounded,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : null),
        ),
      ),
    );
  }
}
