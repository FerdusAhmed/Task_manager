import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/wigets/screen_brackground.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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

                  Text('Get Started',
                      style: Theme.of(context).textTheme.titleLarge,
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
                    height: 10,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,

                      hintText: 'password',
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
                          text: 'dont have any account?',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,

                        ),
                          children: [
                            TextSpan(
                              text: 'sing up',style:
                                TextStyle(
                                  color: Colors.green,
                                ),
                              recognizer: TapGestureRecognizer()..onTap = _ontapsignup,
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

  }
  void _ontapsignup()
  {


  }
  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();

    super.dispose();
  }
}
