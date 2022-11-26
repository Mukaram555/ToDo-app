import 'package:flutter/material.dart';
import 'package:todo_app/widget/task_list_item.dart';

import '../model/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> task;
  const TaskList({Key? key,required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTask(),
    );
  }
  List<Widget> getChildrenTask(){
    return task.map((e) => TaskListItem(task: e)).toList();
  }
}
