import 'package:flutter/material.dart';
import 'package:todo_app/config/router/router.dart';
import 'package:todo_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
    );
  }
}
