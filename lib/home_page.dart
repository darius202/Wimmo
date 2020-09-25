import 'package:flutter/material.dart';
import 'package:wimmobeta/constants.dart';
import 'package:wimmobeta/databody.dart';
import 'package:wimmobeta/recherche.dart';
import 'package:wimmobeta/suggestion.dart';
import 'package:wimmobeta/constants.dart';
import 'package:wimmobeta/databody.dart';
import 'package:wimmobeta/transition.dart';
class HomePage extends StatefulWidget{

  @override
  _HomePage createState()=> new _HomePage();

}

class _HomePage extends State<HomePage>{

  GlobalKey <ScaffoldState> _scaffoldkey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaffoldkey = GlobalKey();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldkey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: kPrimaryColor,),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/image1.jpg',
          fit: BoxFit.contain,
          height: 400,
          width: 190,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: kPrimaryColor,size:30),
           onPressed: (){
             Navigator.push(context, SlideRightRoute(page:  Admin()));
           },
          ),
        ],
      ),
      body: DataBody(),
    );
  }

}


