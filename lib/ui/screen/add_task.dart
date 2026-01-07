import 'package:flutter/material.dart';
import 'package:task_manager/ui/wigets/screen_brackground.dart';

import '../wigets/app_bar.dart';
import 'meterial_selected.dart';
class addtask extends StatefulWidget {
  const addtask({super.key});

  static const String name = 'apptask';

  @override
  State<addtask> createState() => _addtaskState();
}

class _addtaskState extends State<addtask> {

  final TextEditingController _titleedit = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),

      body: ScreenBrackground(
    child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text('Add new work',style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _titleedit,
                validator: (String ? value){
                  if(value?.trim().isEmpty ?? true)
                    {
                      return 'enter title';
                    }
                  return null;
                },


                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: 'title',
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                controller: _description,
                validator: (String ? value){
                  if(value?.trim().isEmpty ?? true)
                    {
                      return 'description';

                    }
                  return null;
              },
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),

                  hintText: 'Description',
                ),
              ),
              const SizedBox(height: 16,),

              ElevatedButton(onPressed: _ontab, child: Icon(Icons.arrow_circle_right_outlined))


            ],
          ),
        ),
      ),
      ),

    );

  }

  void _ontab(){
    if(_formkey.currentState!.validate()){
      //to do
    }
    Navigator.pushNamedAndRemoveUntil(context, MetarialSelect.name, (predicate)=>false);
  }
  @override
  void dispose() {
    _titleedit.dispose();
    _description.dispose();
    super.dispose();
  }
}
