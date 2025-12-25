import 'package:flutter/material.dart';

import '../wigets/TaskCard.dart';
import '../wigets/task_control.dart';

class MetarialSelect extends StatefulWidget {
  const MetarialSelect({super.key});

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
        return Task_card(
          color: Colors.green,
        );
        })
        ,),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()
      {

      }, child: Icon(Icons.add),
      ),
    );
  }
}




