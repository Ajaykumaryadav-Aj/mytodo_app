import 'package:flutter/material.dart';
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
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
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
      ),
    );
  }
}
