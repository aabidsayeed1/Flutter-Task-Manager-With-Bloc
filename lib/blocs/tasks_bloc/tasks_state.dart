// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTasks;
  const TasksState({
    this.pendingTasks = const [],
    this.completedTasks = const [],
    this.favoriteTasks = const [],
    this.removedTasks = const [],
  });

  @override
  List<Object> get props =>
      [pendingTasks, completedTasks, favoriteTasks, removedTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks: List<Task>.from(
        (map['pendingTasks']).map(
          (x) => Task.fromMap(x),
        ),
      ),
      completedTasks: List<Task>.from(
        (map['completedTasks']).map(
          (x) => Task.fromMap(x),
        ),
      ),
      favoriteTasks: List<Task>.from(
        (map['favoriteTasks']).map(
          (x) => Task.fromMap(x),
        ),
      ),
      removedTasks: List<Task>.from(
        (map['removedTasks']).map(
          (x) => Task.fromMap(x),
        ),
      ),
    );
  }
}
