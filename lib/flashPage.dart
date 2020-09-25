import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wimmobeta/recherche.dart';
import 'package:wimmobeta/errorconnect.dart';
import 'package:wimmobeta/Services/data.dart';
import 'package:wimmobeta/Services/Servicespage.dart';
import 'package:wimmobeta/transition.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getVille();
    _getPays();
    _getQuartier();
    _getMandat();
    _getlouable();
    _getEtage();
    _getSituation();
    startTime();
  }
  _getSituation(){
    Situationservices.getSituationadmin().then((value) {
      situation=value;
    });
  }
  _getMandat(){
    TypeBienservices.getMandat().then((value) {
      setState(() {
        mandat=value;
      });
    });
  }
 _getlouable(){
    Bienservices.getLouer().then((value) {
      setState(() {
        louable=value;
      });
    });
 }

 _getEtage(){
    Etageservices.getEtage().then((value) {
      setState(() {
        etage=value;
      });
    });
 }
  _getVille(){
    Villeservices.getVille().then((value) {
      setState(() {
        ville=value;
      });
    });
  }
  _getPays(){
    Paysservices.getPays().then((value) {
      setState(() {
        pays =value;
      });
    });
  }
  _getQuartier(){
    Quartierservices.getQuartier().then((value) {
      setState(() {
        quartier= value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }
  route() {
    if(pays.length ==0 || ville.length ==0 ||  quartier.length==0 || louable.length==0 || etage.length==0)
      {
        Navigator.push(context,  SlideRightRoute(page:  Connector())).then((value) {
          setState(() {
            _getVille();
            _getPays();
            _getQuartier();
            _getMandat();
            _getlouable();
            _getEtage();
            startTime();
          });
        });
      }else
    Navigator.pushReplacement(context, SlideRightRoute(page:  Admin()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF184098),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("assets/logo.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0,bottom:20.0)),
            Text(
              "Afrique Immobilier",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0,bottom: 50)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}