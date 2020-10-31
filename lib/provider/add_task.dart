import 'package:flutter/material.dart';
import 'package:todoey/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  int get taskCount {
    return tasks.length;
  }

  void addTaskList(String newTitle) {
    final task = Task(data: newTitle);
    tasks.add(task);
    notifyListeners();
  }

  void upDateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}