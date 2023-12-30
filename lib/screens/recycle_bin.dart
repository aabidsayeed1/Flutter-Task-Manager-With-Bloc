import 'package:flutter/material.dart';
import 'package:task_app/screens/my_drawer.dart';
import 'package:task_app/widgets/tasks_list.dart';

import '../blocs/bloc_exports.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      final removedList = state.removedTasks;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Recycle Bin'),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete all tasks'),
                  ),
                  onTap: () =>
                      context.read<TasksBloc>().add(const DeleteAllTasks()),
                ),
              ],
            )
          ],
        ),
        drawer: const MyDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${removedList.length} Tasks',
                ),
              ),
            ),
            TasksList(taskList: removedList)
          ],
        ),
      );
    });
  }
}
