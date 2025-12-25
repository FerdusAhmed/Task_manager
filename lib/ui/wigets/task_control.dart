import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Summary_card extends StatelessWidget {
  const Summary_card({
    super.key, required this.title, required this.count,
  });
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,

      child:Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$count',style: Theme.of(context).textTheme.titleLarge,),
            Text(title,maxLines: 1,),
          ],

        ),
      ),
    );
  }
}