import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/sign_in_screen.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  const Appbar({
    super.key,
  });

  @override
  State<Appbar> createState() => _AppbarState();


  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        children: [
          CircleAvatar(


          ),
          SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Ferdus Ahmed',style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
                Text('ferdus@gmail.com',style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),),
              ],
            ),

          ),
          IconButton(onPressed: _ontaplogout, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }



  void _ontaplogout()
  {
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate) => false);
  }
}