import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/Singup_Screen.dart';
import 'package:task_manager/ui/screen/forget_pass_email.dart';
import 'package:task_manager/ui/screen/pin_varification.dart';
import 'package:task_manager/ui/screen/set_password.dart';
import 'package:task_manager/ui/screen/sign_in_screen.dart';
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

      initialRoute: '/',
      routes: {
     SplashScreen.name : (context) => SplashScreen(),
     SignInScreen.name : (context) => SignInScreen(),
        SignUpScreen.name : (context) => SignUpScreen(),
        forgot_pass .name : (context) => forgot_pass (),
        pin_verification.name : (context) => pin_verification(),
        Set_pass.name : (context) => Set_pass(),


      },


    );
  }
}
