import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/infraestructure/presentation/common/utils/styles.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.backgroundGradient,
      child: const Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();
  @override
  Widget build(BuildContext context) {
    final Widget introWallPaper =
        SizedBox(width: 330, height: 330, child: SvgPicture.asset('assets/logo_intro.svg'));
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            introWallPaper,
            const SizedBox(height: 30),
            const SizedBox(
                width: 350,
                height: 150,
                child: Text(
                    'Gestioná de mejor manera las tareas de tu día.\n'
                    'Con esta simple aplicación, las vas poder recordar muy fácilmente..',
                    style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 22),
                    textAlign: TextAlign.center)),
            const Expanded(child: SizedBox()),
            const _CustomButtom(),
          ],
        )
      ],
    ));
  }
}

class _CustomButtom extends StatelessWidget {
  const _CustomButtom();

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 0.1, spreadRadius: 0)]);
    return GestureDetector(
      onTap: () => context.push('/home'),
      child: Container(
        width: 200,
        height: 50,
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Empezar',
              style: TextStyle(color: Styles.secondColor, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
