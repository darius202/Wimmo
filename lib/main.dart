import 'package:flutter/material.dart';
import 'package:wimmo/flashScreen.dart';
import 'package:wimmo/product_screen.dart';
import 'package:wimmo/constants.dart';
import 'package:wimmo/questionsbody.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wimmo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}