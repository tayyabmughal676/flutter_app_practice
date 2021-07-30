import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Task.dart';

class TaskData extends ChangeNotifier{
  List<Task> listTask = [
    Task(title: "Screen 1", isDone: false),
    Task(title: "Screen 2", isDone: true),
    Task(title: "Screen 3", isDone: false),
    Task(title: "Screen 4", isDone: true),
    Task(title: "Screen 5", isDone: false),
  ];

  toggle(int index, bool? value) {
    listTask[index].isDone = value;
    notifyListeners();
  }
}