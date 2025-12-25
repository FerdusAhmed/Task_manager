import 'package:flutter/material.dart';

class Task_card extends StatelessWidget {
  const Task_card({
    super.key, required this.color,
  });
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('title is here',style: Theme.of(context).textTheme.bodyMedium,),
          Text('description',style: TextStyle(
            color: Colors.black45,
          ),),
          Text('date: 12/12/25'),
          SizedBox(height: 10,),
          Row(
            children: [
              Chip(label: Text('new',style: TextStyle(

                color: Colors.white,

              ),

              ),
                backgroundColor: color,
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(20),


                ),),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit)),

            ],
          )

        ],

      ),

    );
  }
}