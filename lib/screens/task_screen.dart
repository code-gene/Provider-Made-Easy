import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/add_task.dart';
import 'package:todoey/widget/task_tile.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTask(),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 75,
                  left: 45,
                  right: 30,
                  bottom: 30
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                        Icons.list,
                        size: 35,
                        color: Colors.lightBlueAccent
                    ),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(height: 20.0),

                  Text(
                      'Todoey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                      )
                  ),

                  Text(
                      '${Provider.of<TaskData>(context).taskCount} Tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      )
                  ),
                  SizedBox(height: 20.0),

                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 800,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 32.0, left: 16.0, right: 16.0),
                  child: Consumer<TaskData>(
                      builder: (context, taskData, child) {
                        return ListView.builder(
                          itemCount: taskData.taskCount,
                          itemBuilder: (context, index) {
                            return Todo(index: index);
                          },
                        );
                      }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddTask extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    String newTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: keyboardOpen ? 500: 300,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 24.0,
                left: 48,
                right: 48,
                bottom: 24
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                      'Add Task',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      )
                  ),
                  TextField(
                      autofocus: true,
                      onChanged: (newText) {
                        newTitle = newText;
                      }
                  ),
                  FlatButton(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false).addTaskList(newTitle);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}

