import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/wigets/screen_brackground.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = 'signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _phone = TextEditingController();


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

                Text('Join with us',
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
                  controller: _fname,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'First name',
                    hintStyle: TextStyle(
                      color:  Colors.grey,),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,

                    ),



                  ),
                  textInputAction: TextInputAction.next,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true)
                    {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _lname,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Last name',
                    hintStyle: TextStyle(
                      color:  Colors.grey,),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,

                    ),



                  ),
                  textInputAction: TextInputAction.next,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true)
                    {
                      return 'Enter your Last name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),TextFormField(
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Mobile',
                    hintStyle: TextStyle(
                      color:  Colors.grey,),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,

                    ),



                  ),
                  textInputAction: TextInputAction.next,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true)
                    {
                      return 'Enter your phone number';
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

                    onPressed: _ontapsignup, child: Icon(Icons.arrow_circle_right_outlined)),
                SizedBox(height: 35,),

                Center(

                     child:  RichText(text: TextSpan(
                          text: 'have an account?',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,

                      ),
                          children: [
                            TextSpan(
                              text: 'sing In',style:
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
  void _ontapsignup()
  {
    if(_formkey.currentState!.validate())
    {
      //TODO : SignIn;
    }

  }

  void _ontapsignin()
  {
    Navigator.pop(context);


  }
  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    _phone.dispose();
    _fname.dispose();
    _lname.dispose();

    super.dispose();
  }
}
