

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showsnackbar(BuildContext contex, String message){
  ScaffoldMessenger.of(contex).showSnackBar(SnackBar(content: Text(message)));
}