import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wimmobeta/constants.dart';
import 'package:wimmobeta/product.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class PageViewDemo extends StatefulWidget {
  PageViewDemo({
    Key key,
    this.produit,
    this.convert,
  }) : super(key: key);
  Product produit;
  int convert;
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {

  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        MyPage1Widget(image1: widget.produit.image1,
          image2: widget.produit.image2,
          image3: widget.produit.image3,
          image4: widget.produit.image4,title: widget.produit.intitule_bien,
        pays: widget.produit.pays,ville: widget.produit.ville,quartier: widget.produit.quartier,
        description: widget.produit.description,
        contact: widget.produit.admincontact,
        prix: moneyFormat(widget.produit.prix),negoce: widget.produit.negoce,
        mandat: widget.produit.type_mandat,type: widget.produit.type_bien,
        superficie: widget.produit.superficie,
        nbetage: widget.produit.nbetage,
        ),
      ],
    );
  }
}
class MyPage1Widget extends StatefulWidget {
   MyPage1Widget({
    Key key,
    this.image1, this.image2, this.image3, this.image4, this.title, this.pays, this.ville, this.quartier, this.contact, this.description,
    this.prix,this.negoce, this.mandat, this.type, this.superficie, this.nbetage, this.nbpiece, this.nbchambre, this.nbsallebain, this.nbtoilvisiteur, this.nbsallesejour
  }) : super(key: key);
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String title;
  final String pays;
  final String ville;
  final String quartier;
  final String contact;
  final String description;
  final String prix;
  final String negoce;
  final String mandat;
   final String type;
   final String superficie;
   final String nbetage;
   final String nbpiece;
   final String nbchambre;
   final String nbsallebain;
   final String nbtoilvisiteur;
   final String nbsallesejour;

  @override
  _MyPage1WidgetState createState() => _MyPage1WidgetState();
}


class _MyPage1WidgetState extends State<MyPage1Widget> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top:10.0),
                  child: Center(
                    child: Text(widget.title,style: TextStyle(color: Colors.white),),
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.height/2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: kPrimaryColor
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(
                      vertical: kDefautPadding
                  ),
                  height: MediaQuery.of(context).size.width/2,
                  width: MediaQuery.of(context).size.width/2,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Image.network("https://gerestock.com/immo/images/"+ widget.image1,fit: BoxFit.cover,
                        loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return widget.image1 ==""?Container(
                            margin: EdgeInsets.only(left: 10.0,right: 10.0),
                            height: MediaQuery.of(context).size.width/2,
                            width: MediaQuery.of(context).size.width/2,
                            child: Center(
                              child:Image.asset("assets/images/logo.jpg"),
                            ),
                          ):Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null ?
                              loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(
                      vertical: kDefautPadding
                  ),
                  height: MediaQuery.of(context).size.width/2,
                  width: MediaQuery.of(context).size.width/2,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Image.network("https://gerestock.com/immo/images/"+ widget.image2,fit: BoxFit.cover,
                        loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return widget.image2 ==""? Container(
                            margin: EdgeInsets.only(left: 10.0,right: 10.0),
                            height: MediaQuery.of(context).size.width/2,
                            width: MediaQuery.of(context).size.width/2,
                            child: Center(
                           child:Image.asset("assets/images/logo.jpg"),
                            ),

                          ) :Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null ?
                              loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3.0),
                  margin: EdgeInsets.symmetric(
                      vertical: kDefautPadding/4
                  ),
                  height: MediaQuery.of(context).size.width/2,
                  width: MediaQuery.of(context).size.width/2,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Image.network("https://gerestock.com/immo/images/"+ widget.image3,fit: BoxFit.cover,
                        loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return widget.image3 ==""?Container(
                            margin: EdgeInsets.only(left: 10.0,right: 10.0),
                            height: MediaQuery.of(context).size.width/2,
                            width: MediaQuery.of(context).size.width/2,
                            child: Center(
                              child:Image.asset("assets/images/logo.jpg"),
                            ),
                          ):Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null ?
                              loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3.0),
                  margin: EdgeInsets.symmetric(
                      vertical: kDefautPadding/4
                  ),
                  height: MediaQuery.of(context).size.width/2,
                  width: MediaQuery.of(context).size.width/2,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Image.network("https://gerestock.com/immo/images/"+ widget.image4,fit: BoxFit.cover,
                        loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return widget.image4 ==""?Container(
                            margin: EdgeInsets.only(left: 10.0,right: 10.0),
                            height: MediaQuery.of(context).size.width/2,
                            width: MediaQuery.of(context).size.width/2,
                            child: Center(
                              child:Image.asset("assets/images/logo.jpg"),
                            ),
                          ):Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null ?
                              loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              //height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: kPrimaryColor
              ),
              child: Column(
                children: [
                  Text("Détails",style: TextStyle(color: Colors.white),textScaleFactor: 1.2,),
                  SizedBox(height: 18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Localisation du bien : ",style: TextStyle(color: Colors.white)),
                      Text(widget.pays+"-",style: TextStyle(color: Colors.white)),
                      Text(widget.ville+"-",style: TextStyle(color: Colors.white)),
                      Text(widget.quartier,style: TextStyle(color: Colors.white))
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Description : ",style: TextStyle(color: Colors.white)),
                      Text(widget.description,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Prix : ",style: TextStyle(color: Colors.white)),
                      Text(widget.mandat+" à ",style: TextStyle(color: Colors.white)),
                      Text(widget.prix+",  ",style: TextStyle(color: Colors.white)),
                      Text(widget.negoce,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  widget.superficie=='0'?
                  Text(""): Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\nSuperficie : \n",style: TextStyle(color: Colors.white)),
                      Text(widget.superficie+" mètre carré",style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  widget.nbetage=='0'?
                  Text(""): Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\n niveau d'étage : \n",style: TextStyle(color: Colors.white)),
                      Text(widget.nbetage,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  widget.nbpiece=='0'?
                  Text(""): Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\nNombre de pièce : \n",style: TextStyle(color: Colors.white)),
                      Text(widget.nbpiece,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  widget.nbchambre=='0'?
                  Text(""): Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\n Nombre de chambre : \n",style: TextStyle(color: Colors.white)),
                      Text(widget.nbchambre,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  widget.nbtoilvisiteur=='0'?
                  Text(""): Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\n Nombre de toillette visiteur: \n",style: TextStyle(color: Colors.white)),
                      Text(widget.nbtoilvisiteur,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  widget.nbsallebain=='0'?
                  Text(""): Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\n Nombre de salle de bain : \n",style: TextStyle(color: Colors.white)),
                      Text(widget.nbsallebain,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  widget.nbsallesejour=='0'?
                  Text(""): Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\n Nombre de salon : \n",style: TextStyle(color: Colors.white)),
                      Text(widget.nbsallesejour,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Contact : ",style: TextStyle(color: Colors.white)),
                      Text(widget.contact,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Container(
                    decoration: BoxDecoration(
                        color: kBackgroundColor
                    ),
                    child: FlatButton(
                        color: kBackgroundColor,
                        onPressed: (){
                          launchWhatsApp("229"+widget.contact,"Annonce wimmobeta \n\n"+widget.title+" \nLocalisation: "+widget.pays+"-"+widget.ville+"-"+widget.quartier
                          +"\nType du bien: "+widget.type+"\n"+"prix: "+widget.prix+" "+widget.negoce+"\n\nPrêt pour les négociations"+"\n https://gerestock.com/immo/images/"+ widget.image1);
                        }, child: Text("Envoyez un message",style: TextStyle(color:kPrimaryColor),)),
                  ),
                  SizedBox(height: 14,)
                ],
              ),
            )
          ],
        )
    );
  }
}

class MyPage3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            MyBox(darkRed),
            MyBox(darkRed),
          ],
        ),
        MyBox(mediumRed, text: 'PageView 3'),
        Row(
          children: [
            MyBox(lightRed),
            MyBox(lightRed),
            MyBox(lightRed),
          ],
        ),
      ],
    );
  }
}

const lightBlue = Color(0xff00bbff);
const mediumBlue = Color(0xff00a2fc);
const darkBlue = Color(0xff0075c9);

final lightGreen = Colors.green.shade300;
final mediumGreen = Colors.green.shade600;
final darkGreen = Colors.green.shade900;

final lightRed = Colors.red.shade300;
final mediumRed = Colors.red.shade600;
final darkRed = Colors.red.shade900;

class MyBox extends StatelessWidget {
  final Color color;
  final double height;
  final String text;

  MyBox(this.color, {this.height, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        color: color,
        height: (height == null) ? 150 : height,
        child: (text == null)
            ? null
            : Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
launchWhatsApp(String phone,String message) async {
  String url ="https://api.whatsapp.com/send?phone="+phone+"&text="+message;

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
