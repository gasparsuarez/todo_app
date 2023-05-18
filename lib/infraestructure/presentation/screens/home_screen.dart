import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/infraestructure/presentation/common/utils/styles.dart';
import 'package:todo_app/infraestructure/presentation/common/widgets/custom_checkbox_tile.dart';

import '../../../application/blocs/task_bloc/task_bloc.dart';
import '../common/widgets/custom_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.backgroundGradient,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Basic TO-DO Application',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: const _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: SafeArea(
          child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _ToDoBoxContent(),
                const SizedBox(height: 10),
                BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return state.taskList.isEmpty
                        ? const Text('')
                        : const Text(
                            '* Manten presionado un elemento para eliminarlo.',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          );
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          CustomDialog().addTaskDialog(context);
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Nueva tarea', style: TextStyle(fontSize: 18))),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                        onPressed: () {
                          context.read<TaskBloc>().add(ClearTasksEvent());
                        },
                        icon: const Icon(Icons.delete_outline_rounded),
                        label: const Text('Borrar todo', style: TextStyle(fontSize: 18))),
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class _ToDoBoxContent extends StatelessWidget {
  const _ToDoBoxContent();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.7,
      decoration: Styles.boxContentDecoration,
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Align(
            alignment: Alignment.topCenter,
            child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: state.taskList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      _showDeleteDialog(context, index);
                    },
                    child: CustomCheckBoxTile(index: index),
                  );
                }),
          );
        },
      ),
    );
  }

  _showDeleteDialog(context, int index) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return SimpleDialog(
            title: const Text('Eliminar tarea?'),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      return TextButton(
                          onPressed: () {
                            context.read<TaskBloc>().add(DeleteTaskEvent(index: index));
                            Navigator.pop(context);
                          },
                          child: const Text('Eliminar'));
                    },
                  ),
                  const SizedBox(width: 5),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar')),
                ],
              )
            ],
          );
        }));
  }
}
