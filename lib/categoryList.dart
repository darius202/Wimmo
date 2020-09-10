import 'package:flutter/material.dart';
import 'package:wimmo/constants.dart';
import 'package:wimmo/transition.dart';
import 'package:wimmo/suggestion.dart';
import 'package:wimmo/product.dart';
class CategoryList extends StatefulWidget{
  @override
  _CategoryListState createState()=> _CategoryListState();

}

class _CategoryListState extends State<CategoryList>{
  int selectedIndex=0;
  List categories=["Résulta(s)","Suggestions"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefautPadding/2),
      height: 30,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) => GestureDetector(
          onTap: (){
            setState(() {
              selectedIndex=index;
            });
          },
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: kDefautPadding),
              margin: EdgeInsets.only(
                  left: kDefautPadding,
                  right: index == categories.length -1 ? kDefautPadding:0
              ),
              decoration: BoxDecoration(
                  color: index==selectedIndex ? Colors.white.withOpacity(0.4): Colors.transparent,
                  borderRadius: BorderRadius.circular(6) ),
              child: Text(
               produts.length.toString()+ categories[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: (){
              if(categories[index]=="Suggestions")
              {
                Navigator.push(context, SlideRightRoute(page: Suggestion()));
              }
            },
          ),
        ),
      ),
    );
  }

}