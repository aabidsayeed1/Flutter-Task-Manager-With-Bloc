import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';

import 'package:task_app/widgets/tasks_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      final tasksList = state.pendingTasks;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: Text(
                '${tasksList.length} Pending  |  ${state.completedTasks.length} Completed',
              ),
            ),
          ),
          TasksList(taskList: tasksList)
        ],
      );
    });
  }
}
