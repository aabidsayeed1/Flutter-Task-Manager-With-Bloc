import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/services/guid_gen.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  EditTaskScreen({super.key, required this.oldTask});

  @override
  Widget build(BuildContext context) {
    titleController.text = oldTask.title;
    descriptionController.text = oldTask.description;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Edit Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
                label: Text('Description'), border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    context.read<TasksBloc>().add(EditTask(
                        oldTask: oldTask,
                        newTask: Task(
                          title: titleController.text,
                          description: descriptionController.text,
                          id: GUIDGen.generate(),
                          isDone: false,
                          isFavorite: oldTask.isFavorite,
                          date: DateTime.now().toString(),
                        )));
                    Navigator.pop(context);
                  },
                  child: const Text('Save')),
            ],
          )
        ],
      ),
    );
  }
}
