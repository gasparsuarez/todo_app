import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const IntroScreen(),
  )
]);
