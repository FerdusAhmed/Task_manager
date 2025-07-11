import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/splash_screen.dart';

class taskmanagerapp extends StatelessWidget {
  const taskmanagerapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
