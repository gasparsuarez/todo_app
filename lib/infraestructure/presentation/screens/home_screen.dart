import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/infraestructure/presentation/common/utils/styles.dart';

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
                const Text(
                  '* Manten presinado un elemento para eliminarlo.',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                    onPressed: () {
                      CustomDialog().addTaskDialog(context);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Nueva Tarea', style: TextStyle(fontSize: 18))),
                const SizedBox(width: 10)
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
          return ListView.builder(
              itemCount: state.taskList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    _showDeleteDialog(context, index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    child: DecoratedBox(
                      decoration: Styles.checkBoxDecoration,
                      child: CheckboxListTile(
                        value: state.taskList[index].isActive,
                        onChanged: (value) {
                          context
                              .read<TaskBloc>()
                              .add(UpdateCheckBoxEvent(index: index, isEnabled: value!));
                        },
                        title: Text(
                          state.taskList[index].title,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        subtitle: Text(
                          state.taskList[index].detail,
                          style: const TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              });
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
