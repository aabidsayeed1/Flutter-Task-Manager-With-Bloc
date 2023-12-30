import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';

import 'package:task_app/widgets/tasks_list.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      final tasksList = state.completedTasks;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: Text(
                '${tasksList.length} Tasks',
              ),
            ),
          ),
          TasksList(taskList: tasksList)
        ],
      );
    });
  }
}
