import 'package:flutter/material.dart';

enum tasktype{ tnew,prog,comp,can

}

class Task_card extends StatelessWidget {
  const Task_card({
    super.key, required this.Taskt,
  });
  final tasktype Taskt;


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
              Chip(label: Text(_getname(),style: TextStyle(

                color: Colors.white,

              ),

              ),
                backgroundColor:  _gettask(),
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
  Color _gettask()
  {
    switch(Taskt)
        {
      case tasktype.tnew:

          return Colors.blue;

      case tasktype.prog:

        return Colors.yellow;
      case tasktype.comp:
       return Colors.purple;
      case tasktype.can:
       return Colors.red;
    }

  }
  String _getname()
  {
    switch (Taskt) {
      case tasktype.tnew:

        return 'new';
      case tasktype.prog:
        return 'progress';
      case tasktype.comp:
        return 'complete';
      case tasktype.can:
       return 'canceled';
    }

  }
}