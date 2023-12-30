import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreCallback;

  const PopupMenu({
    super.key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.editTaskCallback,
    required this.restoreCallback,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) => [
              if (!task.isDeleted!) ...[
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                  onTap: () => editTaskCallback(),
                ),
                PopupMenuItem(
                  onTap: () => likeOrDislikeCallback(),
                  child: TextButton.icon(
                      onPressed: null,
                      icon: Icon(task.isFavorite!
                          ? Icons.bookmark_remove
                          : Icons.bookmark_add_outlined),
                      label: Text(task.isFavorite!
                          ? 'Remove from \nFavorites'
                          : 'Add To \nFavorites')),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete')),
                  onTap: () => cancelOrDeleteCallback(),
                ),
              ] else ...[
                PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore')),
                  onTap: () => restoreCallback(),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete Forever')),
                  onTap: () => cancelOrDeleteCallback(),
                ),
              ]
            ]);
  }
}
