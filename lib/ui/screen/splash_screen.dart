import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ui/screen/sign_in_screen.dart';
import 'package:task_manager/ui/utils/asset_path.dart';
import 'package:task_manager/ui/wigets/screen_brackground.dart';

class SplashScreen extends StatefulWidget {


  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movetonextscreen();
  }
  Future<void> movetonextscreen() async {
    await Future.delayed(Duration(seconds: 3));
    
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBrackground(child: Center(child: SvgPicture.asset(asset_path.logo)),


        ),

    );
  }
}
