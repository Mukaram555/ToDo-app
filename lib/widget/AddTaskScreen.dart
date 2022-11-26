import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/provider/todo_model.dart';
import '../colors/colors.dart';


class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskTitleController = TextEditingController();
  bool completion = false;

  @override
  void dispose() {
    taskTitleController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String textVal = taskTitleController.text;
    final bool completed = completion;
    if (textVal.isNotEmpty) {
      final Task todo = Task(
        title: textVal,
        completed: completed,
      );
      Provider.of<TodoModel>(context, listen: false).addTask(todo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsOfApp.appBarColor,
        title: const Text("Add Task"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: taskTitleController,
                ),
                CheckboxListTile(
                  value: completion,
                  onChanged: (checked) => setState(() {
                    completion = checked!;
                  }),
                  title: const Text("Complete?"),
                ),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: ),
                  onPressed: onAdd,
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
