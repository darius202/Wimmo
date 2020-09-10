import 'package:flutter/material.dart';
import 'package:wimmo/constants.dart';
import 'package:wimmo/product_body.dart';
class ProductScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: kPrimaryColor,
     appBar: buildAppBar(),
     body:  Body(),
   );
  }


 AppBar buildAppBar(){
  return AppBar(
     elevation: 0,
     title: Text("Wimmo"),
     centerTitle: true,

   );
 }
}