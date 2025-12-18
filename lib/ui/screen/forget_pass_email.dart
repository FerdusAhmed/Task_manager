import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/Singup_Screen.dart';
import 'package:task_manager/ui/screen/pin_varification.dart';
import 'package:task_manager/ui/wigets/screen_brackground.dart';

class forgot_pass extends StatefulWidget {
  const forgot_pass({super.key});
  static const String name = 'forgot_pass';

  @override
  State<forgot_pass> createState() => _forgot_passState();
}

class _forgot_passState extends State<forgot_pass> {

  final TextEditingController _email = TextEditingController();

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

                Text('Your email address',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 4,
                ),
                Text('A 6 digit OTP sent to your email address',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.grey
                  ),
                ),
                SizedBox(
                  height: 10,
                ),


                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'email',
                    hintStyle: TextStyle(
                      color:  Colors.grey,),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,

                    ),



                  ),
                  textInputAction: TextInputAction.next,
                  validator: (String? value){
                    String email = value ?? '';
                    if(EmailValidator.validate(email) == false)
                    {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),



                SizedBox(
                  height: 20,
                ),
                ElevatedButton(

                    onPressed: _ontapsubmit, child: Icon(Icons.arrow_circle_right_outlined)),
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
      //TODO : SignIn;
      Navigator.pushNamed(context, pin_verification.name);
    }

  }
  void _ontapforgot()
  {




  }
  void _ontapsignin()
  {
    Navigator.pop(context);


  }
  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();


    super.dispose();
  }
}
