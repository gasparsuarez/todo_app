import 'package:go_router/go_router.dart';
import '../../infraestructure/presentation/screens/screens.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const IntroScreen(); // * start screen
      },
      routes: [
        GoRoute(
          path: 'home',
          builder: (context, state) {
            return const HomeScreen();
          },
        )
      ]),
]);
