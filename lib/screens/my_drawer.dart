import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/blocs/switch_bloc/switch_bloc.dart';
import 'package:task_app/screens/recycle_bin.dart';
import 'package:task_app/screens/tabs_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
            child: Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          color: Colors.grey,
          child: Text(
            'Task Drawer',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) => GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, TabScreen.id),
            child: ListTile(
              leading: const Icon(Icons.folder_special),
              title: const Text('My Tasks'),
              trailing: Text(
                  '${state.pendingTasks.length} | ${state.completedTasks.length}'),
            ),
          ),
        ),
        const Divider(),
        BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) => GestureDetector(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, RecycleBin.id),
              child: ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Bin'),
                trailing: Text('${state.removedTasks.length}'),
              )),
        ),
        BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) => Switch(
                value: state.switchValue,
                onChanged: (value) {
                  context.read<SwitchBloc>().add(
                      state.switchValue ? SwitchOffEvent() : SwitchOnEvent());
                }))
      ],
    )));
  }
}
