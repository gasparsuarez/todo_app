import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/blocs/task_bloc/task_bloc.dart';
import '../utils/styles.dart';

class CustomDialog {
  addTaskDialog(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Complete los campos'),
          content: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 5),
              _textForm(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      return FilledButton.tonal(
                        onPressed: () {
                          context.read<TaskBloc>().add(ClearFormEvent());
                          Navigator.pop(context);
                        },
                        style: FilledButton.styleFrom(backgroundColor: Colors.pinkAccent),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      return FilledButton.tonal(
                        onPressed: !state.isEmptyValues
                            ? null
                            : () {
                                context.read<TaskBloc>().add(AddTaskEvent());
                                context.read<TaskBloc>().add(ClearFormEvent());
                                Navigator.pop(context);
                              },
                        style: FilledButton.styleFrom(backgroundColor: Colors.pinkAccent),
                        child: const Text(
                          'Agregar',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ],
              )
            ]),
          ),
        );
      },
    );
  }

  Widget _textForm() {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            _titleField(),
            const SizedBox(height: 10),
            _detailField(),
          ],
        ));
  }

  Widget _titleField() {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return TextFormField(
          autocorrect: false,
          decoration: Styles.dialogInputDecoration(
              label: 'Título',
              hintText: 'Ej: Cortar árboles',
              iconData: Icons.info_outline_rounded),
          onChanged: (value) {
            context.read<TaskBloc>().add(TitleChangedEvent(title: value));
          },
        );
      },
    );
  }

  Widget _detailField() {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return TextFormField(
          autocorrect: false,
          maxLines: 1,
          decoration: Styles.dialogInputDecoration(
              label: 'Información adicional',
              hintText: 'Ej: No olvidarse tijeras',
              iconData: Icons.details_rounded),
          onChanged: (value) {
            context.read<TaskBloc>().add(DetailChangedEvent(detail: value));
          },
        );
      },
    );
  }
}
