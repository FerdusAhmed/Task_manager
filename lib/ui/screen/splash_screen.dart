import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ui/screen/sign_in_screen.dart';
import 'package:task_manager/ui/utils/asset_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
    
    Navigator.pushReplacement(context, MaterialPageRoute(

        builder: (context)=> SignInScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          SvgPicture.asset(asset_path.background,
          fit: BoxFit.cover,
            height: double.maxFinite,
            width: double.maxFinite,
          ),

          Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(asset_path.logo)),

        ],
      ),
    );
  }
}
