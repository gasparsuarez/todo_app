import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/domain/entities/task_entity.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
      if (event is TitleChangedEvent) {
        emit(state.copyWith(title: event.title));
      } else if (event is DetailChangedEvent) {
        emit(state.copyWith(detail: event.detail));
      } else if (event is ClearFormEvent) {
        emit(state.copyWith(title: '', detail: ''));
      } else if (event is AddTaskEvent) {
        emit(state.copyWith(
            taskList: List.of(state.taskList)
              ..add(TaskEntity(title: state.title, detail: state.detail))));
      } else if (event is UpdateCheckBoxEvent) {
        List<TaskEntity> updateList = List.of(state.taskList);
        if (event.index >= 0 || event.index <= updateList.length) {
          updateList[event.index].isActive = event.isEnabled;
        }
        emit(state.copyWith(taskList: updateList));
      } else if (event is DeleteTaskEvent) {
        emit(state.copyWith(taskList: List.of(state.taskList)..removeAt(event.index)));
      }
    });
  }
}
