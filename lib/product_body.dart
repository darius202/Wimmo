import 'package:flutter/material.dart';
import 'package:wimmo/searchbox.dart';
import 'package:wimmo/categoryList.dart';
import 'package:wimmo/constants.dart';
import 'package:wimmo/product_card.dart';
import 'package:wimmo/product.dart';
import 'package:wimmo/details_screen.dart';
import 'package:wimmo/transition.dart';
import 'package:wimmo/questionsbody.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, SlideRightRoute(page:Questionbody()));
            },
            child: SearchBox(),
          ),
          CategoryList(),
          SizedBox(height: kDefautPadding/2,),
          Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin:  EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )
                    ),
                  ),
                  ListView.builder(
                      itemCount: produts.length,
                      itemBuilder: (context,index) => ProductCard(
                        itemIndex: index,
                        product: produts[index],
                        press: (){
                          Navigator.push(context, SlideRightRoute(page: Details(produit:  produts[index],)));
                        },
                      )
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}

