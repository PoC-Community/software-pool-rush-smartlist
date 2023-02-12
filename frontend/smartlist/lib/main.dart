import 'package:flutter/material.dart';
import 'package:smartlist/pages/StartScreen.dart';
import 'package:smartlist/pages/RegisterScreen.dart';
import 'package:smartlist/pages/LoginScreen.dart';
import 'package:smartlist/pages/CurrentScreen.dart';
import 'package:smartlist/pages/ShopsScreen.dart';
import 'package:smartlist/pages/CreateList.dart';
import 'package:smartlist/pages/ReadList.dart';
import 'package:smartlist/pages/ResultListOfOneShop.dart';
import 'package:smartlist/pages/AddNewProduct.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartList',

      /// TODO Replace with your first screen class name
      home: CurrentScreen(),//StartScreen(),
    );
  }
}
