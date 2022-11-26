import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_model.dart';
import 'package:todo_app/widget/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> TodoModel(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: HomeScreen(),
    ),
    );
  }
}
