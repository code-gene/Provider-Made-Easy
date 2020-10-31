import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/add_task.dart';

class Todo extends StatelessWidget {

  final int index;
  Todo({this.index});

  @override
  Widget build(BuildContext context) {
    bool isChecked = Provider.of<TaskData>(context).tasks[index].isDone;
    return ListTile(
      onLongPress: () {
        Provider.of<TaskData>(context, listen: false).deleteTask(Provider.of<TaskData>(context, listen: false).tasks[index]);
      },
      title: Text(
          Provider.of<TaskData>(context).tasks[index].data,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough: null
        ),
      ),
      trailing : Checkbox(
        value: isChecked,
        onChanged: (value) {
          Provider.of<TaskData>(context, listen: false).upDateTask(
              Provider.of<TaskData>(context, listen: false).tasks[index]
          );
        },
      )
    );
  }
}
