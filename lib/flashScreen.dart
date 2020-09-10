import 'Dart:async';
import 'package:flutter/material.Dart';
import 'package:wimmo/questionsbody.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Questionbody())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          //  height: MediaQuery.of(context).size.height/3,
            child: Container(
              padding: EdgeInsets.only(top:60.0,left: 30.0,right: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset('assets/images/icon.png',fit: BoxFit.cover,),
                Text("Le monde de l'immobilier",style: TextStyle(color: Colors.blueAccent),),
              ],
            ),
            ),
      ),
    );
  }
}
