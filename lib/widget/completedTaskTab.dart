import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_model.dart';
import 'package:todo_app/widget/task_list.dart';


class CompletedTaskTab extends StatelessWidget {
  const CompletedTaskTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, snapshot,child){
        return TaskList(
          task: snapshot.completedTask,
        );
      },
    );
  }
}
