part of 'task_bloc.dart';

@immutable
class TaskState {
  final String title;
  final String detail;
  final List<TaskEntity> taskList;

  bool get isEmptyValues {
    if (title.isEmpty) {
      return false;
    }
    return true;
  }

  const TaskState({this.detail = '', this.title = '', this.taskList = const []});

  TaskState copyWith({String? title, String? detail, List<TaskEntity>? taskList}) => TaskState(
        title: title ?? this.title,
        detail: detail ?? this.detail,
        taskList: taskList ?? this.taskList,
      );
}

class TaskInitial extends TaskState {}
