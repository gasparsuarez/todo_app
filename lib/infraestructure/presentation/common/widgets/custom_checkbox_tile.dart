import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/infraestructure/presentation/common/utils/styles.dart';

import '../../../../application/blocs/task_bloc/task_bloc.dart';

class CustomCheckBoxTile extends StatelessWidget {
  final int index;
  const CustomCheckBoxTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Container(
        decoration: Styles.checkBoxDecoration,
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return ListTile(
              leading: Checkbox(
                  value: state.taskList[index].isActive,
                  onChanged: (value) {
                    context
                        .read<TaskBloc>()
                        .add(UpdateCheckBoxEvent(index: index, isEnabled: value!));
                  }),
              title: Text(state.taskList[index].title,
                  style: const TextStyle(fontSize: 18, color: Colors.white)),
              subtitle: state.taskList[index].detail.isNotEmpty
                  ? Text(state.taskList[index].detail,
                      style: const TextStyle(fontSize: 18, color: Colors.white))
                  : null,
              trailing: IconButton(
                  onPressed: () {
                    context.read<TaskBloc>().add(UpdateFavoriteEvent(
                        index: index, isFavorite: !state.taskList[index].isFavorite));
                  },
                  icon: state.taskList[index].isFavorite
                      ? const Icon(
                          Icons.star,
                          color: Colors.deepPurple,
                          size: 30,
                        )
                      : const Icon(
                          Icons.star_border,
                          color: Colors.black54,
                          size: 30,
                        )),
            );
          },
        ),
      ),
    );
  }
}
