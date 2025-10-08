import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/asset_path.dart';

class ScreenBrackground extends StatelessWidget {
  const ScreenBrackground({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [

        SvgPicture.asset(asset_path.background,
          fit: BoxFit.cover,
          height: double.maxFinite,
          width: double.maxFinite,
        ),
        SafeArea(child: child,),


      ],
    );
  }
}
