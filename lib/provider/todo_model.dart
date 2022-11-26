import 'package:flutter/material.dart';
import 'dart:collection';

import '../model/task.dart';

class TodoModel extends ChangeNotifier{
  final List <Task> _task = [];
  UnmodifiableListView<Task> get allTask => UnmodifiableListView(_task);
  UnmodifiableListView<Task> get incompleteTasks => UnmodifiableListView(_task.where((element) => !element.completed));
  UnmodifiableListView<Task> get completedTask => UnmodifiableListView(_task.where((element) => element.completed));

  void addTask(Task task){
    _task.add(task);
    notifyListeners();
  }

  void toggleTodo(Task task){
    final taskIndex = _task.indexOf(task);
    _task[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Task task){
    _task.remove(task);
    notifyListeners();
  }

}