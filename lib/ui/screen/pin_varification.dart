
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screen/set_password.dart';

import 'package:task_manager/ui/screen/sign_in_screen.dart';
import 'package:task_manager/ui/wigets/screen_brackground.dart';

class pin_verification extends StatefulWidget {
  const pin_verification({super.key});
  static const String name = 'pin-verification';

  @override
  State<pin_verification> createState() => _pin_verificationState();
}

class _pin_verificationState extends State<pin_verification> {

  final TextEditingController _pin = TextEditingController();

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

                Text('pin varification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 4,
                ),
                Text('A 6 digit OTP has been sent to your email address',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey
                  ),
                ),
                SizedBox(
                  height: 10,
                ),




                PinCodeTextField(
                  controller: _pin,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    selectedFillColor: Colors.yellow,

                    selectedColor: Colors.green,
                    fieldHeight: 30,
                    fieldWidth: 30,
                    inactiveColor: Colors.yellow

                  ),

                  onChanged: (value) {
                    setState(() {
                      //currentText = value;
                    });
                  }, appContext: context,
                ),



                SizedBox(
                  height: 20,
                ),
                ElevatedButton(

                    onPressed: _ontapsubmit, child: Text('Verify')),
                SizedBox(height: 35,),

                Center(
                  child: RichText(text: TextSpan(
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
                ),

              ],
            ),
          ),
        ),
      ),


      ),
    );
  }
  void _ontapsubmit()
  {
    if(_formkey.currentState!.validate())
    {
      Navigator.pushNamed(context, Set_pass.name);


      //TODO : SignIn;
    }


  }

  void _ontapsignin()
  {
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate)=>false);


  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pin.dispose();


    super.dispose();
  }
}
