import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/splash_screen.dart';

class taskmanagerapp extends StatelessWidget {
  const taskmanagerapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   theme: ThemeData(
     primarySwatch: Colors.green,

     textTheme: TextTheme(
       titleLarge: TextStyle(
         fontWeight: FontWeight.w700,
         fontSize: 28,
       )
     ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12),

      ),
    ),
   ),

      home: SplashScreen(),
    );
  }
}
