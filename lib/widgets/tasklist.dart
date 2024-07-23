import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task.dart';

class TaskList extends StatefulWidget {
  final List<String> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskItem(task: widget.tasks[index]);
        },
      ),
    );
  }
}
