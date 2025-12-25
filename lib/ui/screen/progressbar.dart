import 'package:flutter/material.dart';

import '../wigets/TaskCard.dart';

class progress extends StatefulWidget {
  const progress({super.key});

  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(

          itemCount: 10,
          itemBuilder: (context,index){
            return Task_card(
              color: Colors.orange,
            );
          }),
    );
  }
}
