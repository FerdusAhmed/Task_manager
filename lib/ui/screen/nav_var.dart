import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/progressbar.dart';

import '../wigets/app_bar.dart';
import 'meterial_selected.dart';

class Navbar_screen extends StatefulWidget {
  const Navbar_screen({super.key});

  static const String name = 'nav_bar';



  @override
  State<Navbar_screen> createState() => _Navbar_screenState();
}


class _Navbar_screenState extends State<Navbar_screen> {
  List<Widget> _screen= [
    MetarialSelect(),progress(),
  ];
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: Appbar(),
body: _screen[_selected],
bottomNavigationBar: NavigationBar(

  selectedIndex: _selected,
    onDestinationSelected: (int index){
    _selected = index;
    setState(() {

    });
    },


    destinations:

[
  NavigationDestination(icon: Icon(Icons.new_label_outlined), label: 'new'),
  NavigationDestination(icon: Icon(Icons.run_circle_outlined), label: 'progress'),
  NavigationDestination(icon: Icon(Icons.done), label: 'completed'),
  NavigationDestination(icon: Icon(Icons.close), label: 'cancled'),

]),

    );
  }
}


