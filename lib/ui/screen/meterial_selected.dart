import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/add_task.dart';

import '../wigets/TaskCard.dart';
import '../wigets/task_control.dart';

class MetarialSelect extends StatefulWidget {
  const MetarialSelect({super.key});
  static const String name = 'metarial';

  @override
  State<MetarialSelect> createState() => _MetarialSelectState();
}

class _MetarialSelectState extends State<MetarialSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(

          children: [
            SizedBox(
              height: 100,
              child: ListView.separated(

                  itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                return Summary_card(
                  title: 'progress',
                  count: 12,

                );
              }, separatorBuilder: (context, index){
                return SizedBox(width: 8,);
              },


              ),
            ),
        Expanded(child:
        ListView.builder(
          primary: false,
        shrinkWrap: true,

        itemCount: 10,
        itemBuilder: (context,index){
        return Task_card(Taskt: tasktype.tnew,

        );
        })
        ,),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:_ontap,
        child: Icon(Icons.add),
      ),
    );


  }

  void _ontap()
  {
    Navigator.pushNamedAndRemoveUntil(context, addtask.name, (predicate)=>false);
  }
}




