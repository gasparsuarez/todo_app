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

class ClearTasksEvent extends TaskEvent {}

class DeleteTaskEvent extends TaskEvent {
  final int index;
  DeleteTaskEvent({required this.index});
}

class UpdateFavoriteEvent extends TaskEvent {
  final int index;
  final bool isFavorite;

  UpdateFavoriteEvent({required this.index, required this.isFavorite});
}

class UpdateCheckBoxEvent extends TaskEvent {
  final int index;
  final bool isEnabled;
  UpdateCheckBoxEvent({required this.index, required this.isEnabled});
}
