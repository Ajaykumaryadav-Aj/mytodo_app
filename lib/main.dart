import 'package:flutter/material.dart';
import 'package:mytodo_app/provider/todo_provider.dart';
import 'package:mytodo_app/screen/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Mytodo());
}

class Mytodo extends StatelessWidget {
  const Mytodo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Colors.blue),
            
            useMaterial3: true),
        home: const MyTodoApp(),
      ),
    );
  }
}
