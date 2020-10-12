import 'package:flutter/material.dart';
import 'package:wimmobeta/constants.dart';
AppBar buildAppBar(){
  return AppBar(
    iconTheme: new IconThemeData(color: kPrimaryColor),
    backgroundColor: Colors.white,
    elevation: 2.0,
    title: Image.asset(
      'assets/image1.jpg',
      fit: BoxFit.contain,
      height: 400,
      width: 190,
    ),
    centerTitle: true,
  );
}