import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/Singup_Screen.dart';
import 'package:task_manager/ui/screen/sign_in_screen.dart';
import 'package:task_manager/ui/wigets/screen_brackground.dart';

import 'forget_pass_email.dart';

class Set_pass extends StatefulWidget {
  const Set_pass({super.key});
  static const String name= 'set_pass';

  @override
  State<Set_pass> createState() => _Set_passState();
}

class _Set_passState extends State<Set_pass> {

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _conpassword = TextEditingController();
  final GlobalKey <FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBrackground(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 80,),

                Text('Set Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Minimum 8 cha and numeric number',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                ),),
                
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _pass,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color:  Colors.grey,),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,

                    ),



                  ),
                  validator: (String? value){
                    if((value?.length ?? 0) <= 6)
                    {
                      return 'Enter a valid Password';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,

                ),
                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: _conpassword,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,

                    hintText: 'nonfirmpassword',
                    hintStyle: TextStyle(
                      color:  Colors.grey,),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,

                    ),



                  ),
                  validator: (String? value){
                    if((value??'') != _pass.text)
                    {
                      return "password doesen't matched";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(

                    onPressed: _ontaplogin, child: Icon(Icons.arrow_circle_right_outlined)),
                SizedBox(height: 35,),

                Center(
                  child: Column(
                    children: [
                      TextButton(onPressed: _ontapforgot, child: Text(
                        "Fogot password",style: TextStyle(
                        color: Colors.grey,
                      ),
                      )),
                      RichText(text: TextSpan(
                          text: 'have any account?',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,

                      ),
                          children: [
                            TextSpan(
                              text: 'sing in',style:
                            TextStyle(
                              color: Colors.green,
                            ),
                              recognizer: TapGestureRecognizer()..onTap = _ontapsignin,
                            ),

                          ]
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),


      ),
    );
  }
  void _ontaplogin()
  {
    if(_formkey.currentState!.validate())
    {
      //TODO : SignIn;
    }

  }
  void _ontapforgot()
  {

    Navigator.pushNamed(context, forgot_pass .name);

  }
  void _ontapsignin()
  {
    Navigator.pushNamed(context, SignInScreen.name);


  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pass.dispose();
    _conpassword.dispose();

    super.dispose();
  }
}