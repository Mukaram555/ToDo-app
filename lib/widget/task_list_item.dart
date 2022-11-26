import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/provider/todo_model.dart';



class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.completed,
        onChanged: (bool? checked) {
          Provider.of<TodoModel>(context, listen: false).toggleTodo(task);
        },
      ),
      title: Text(task.title),
      trailing: IconButton(icon: const Icon(Icons.delete),color: Colors.red,onPressed: (){
        Provider.of<TodoModel>(context,listen: false).deleteTodo(task);
      },),
    );
  }
}
