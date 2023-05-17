part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class TitleChangedEvent extends TaskEvent {
  final String title;
  TitleChangedEvent({required this.title});
}

class DetailChangedEvent extends TaskEvent {
  final String detail;
  DetailChangedEvent({required this.detail});
}

class AddTaskEvent extends TaskEvent {}

class ClearFormEvent extends TaskEvent {}

class DeleteTaskEvent extends TaskEvent {
  final int index;
  DeleteTaskEvent({required this.index});
}

class UpdateCheckBoxEvent extends TaskEvent {
  final int index;
  final bool isEnabled;
  UpdateCheckBoxEvent({required this.index, required this.isEnabled});
}
