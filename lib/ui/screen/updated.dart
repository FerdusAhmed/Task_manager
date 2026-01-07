import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/ui/screen/sign_in_screen.dart';
import 'package:task_manager/ui/wigets/screen_brackground.dart';

import '../wigets/app_bar.dart';

class update extends StatefulWidget {
  const update({super.key});
  static const String name = 'update';

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedimage;


  final GlobalKey <FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
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

                Text('Update your profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                
                buildphoto(),
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


              ],
            ),
          ),
        ),
      ),


      ),
    );
  }

  Widget buildphoto() {
    return GestureDetector(
      onTap: _takespic,
      child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,

                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey,

                        ),
                        alignment: Alignment.center,

                        child:
                        Text('Photo',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),),
                      ),
                      SizedBox(width: 10,),
                      Text(_selectedimage == null ?'Select image':_selectedimage!.name,
                        maxLines: 1,
                        style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),),
                    ],
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
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate)=>false);

  }

  void _ontapsignin()
  {
    Navigator.pushNamed(context, SignInScreen.name);


  }
  Future<void> _takespic()
  async {
    final XFile? pacef = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(pacef != null)
      {
        _selectedimage = pacef;
        setState(() {

        });
      }

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
