import 'package:flutter/material.dart';
import 'package:todo_app/presentation/common/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.backgroundGradient,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Simple To-Do App'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert_outlined))],
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
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _ToDoBoxContent(),
          ],
        ),
      ],
    ));
  }
}

class _ToDoBoxContent extends StatelessWidget {
  const _ToDoBoxContent();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.7,
      decoration: Styles.boxContentDecoration,
    );
  }
}
