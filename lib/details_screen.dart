import 'package:flutter/material.dart';
import 'package:wimmo/constants.dart';
import 'package:wimmo/product.dart';
import 'package:wimmo/details_image.dart';
import 'package:wimmo/signalbien.dart';
import 'package:wimmo/transition.dart';
 class Details extends StatefulWidget {
   Product produit;
   Details({this.produit});
   @override
   _DetailsState createState() => _DetailsState();
 }

 class _DetailsState extends State<Details> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: kBackgroundColor,
       appBar: buildAppBar(context,widget.produit.id),
       body: PageViewDemo(produit: widget.produit,),
     );
   }
 }

AppBar buildAppBar(BuildContext context,String id){
  return  AppBar(
    backgroundColor: kBackgroundColor,
    elevation: 0,
    leading: IconButton(
        padding: EdgeInsets.only(left: kDefautPadding),
        icon: Icon(Icons.keyboard_backspace,color: Colors.black,),
        onPressed: (){
          Navigator.pop(context);
        }),
    title: Text("Retour".toUpperCase(),
      style: Theme.of(context).textTheme.bodyText2,),
    centerTitle: false,
    actions: <Widget>[
      FlatButton(
        child:Text("Signaler le bien",style: TextStyle(color: Colors.red),),
        onPressed: (){
        Navigator.push(context, SlideRightRoute(page: Signaler(id: id,)));
        },
      )
    ],
  );
}