import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wimmobeta/constants.dart';
import 'package:wimmobeta/Services/Servicespage.dart';
import 'package:wimmobeta/product.dart';
class Signaler extends StatefulWidget {
  Product annonce;
  Signaler(Product annonce){
    this.annonce=annonce;
  }
  @override
  _SignalerState createState() => _SignalerState();
}

class _SignalerState extends State<Signaler> {
  String message;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController contact;
  void _showMessageInScaffold(String message) {
    try {
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(message, style: TextStyle(color: Colors.white,fontSize: 18),),
            duration: Duration(seconds: 2, milliseconds: 500),
          ),
      );
    } on Exception catch (e, s) {
      print(s);
    }
  }

  Future<void> _handleSubmit(BuildContext context) async {
    try {
      Dialogs.showLoadingDialog(context, _keyLoader);//invoking login
      Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();//close the dialoge
    } catch (error) {
      print(error);
    }
  }
  void _onLoading() {
    if(message==""){
      Navigator.pop(context);
      echec("Message vide", "Ecrivez quelque chose");
      return;
    }
    else {
      _handleSubmit(context);
      SignalServices.addSignal(widget.annonce.id, message,contact.text).then((value) {
       if(value=="1"){
         Navigator.pop(context);
         _showMessageInScaffold("Message envoyé avec succès");
         setState(() {
           message="";
         });
       }else{
         Navigator.pop(context);
         _showMessageInScaffold("Message non envoyé");
         setState(() {
           message="";
         });
       }
      });
    }
  }
 retour(){
   Navigator.pop(context);
 }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    message = "";
    contact=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/image1.jpg',
          fit: BoxFit.contain,
          height: 400,
          width: 190,
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.only(top:80,left:10.0,right:10.0) ,
          child: Column(
            children: [
              Center(
                child: TextFormField(
                  onChanged: (String text){
                    setState(() {
                      message=text;
                    });
                  },
                  autocorrect: false,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: "Ecrivez un message aux administrateurs",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: (){
                          _onLoading();
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white70
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/3),
                alignment: Alignment.bottomLeft,
                child: Center(
                  child: TextField(
                    controller: contact,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Votre contact ici",
                        prefixIcon: Icon(Icons.call),
                        filled: true,
                        fillColor: Colors.white70
                    ),
                  ),
                ) ,
              ),
            ],
          )
      ),
    );
  }
  Future<Null> echec(String titre,String erreur) async {
    return (
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return new AlertDialog(
                title: new Text(titre,style: TextStyle(color:Colors.red),),
                content: new Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(erreur),
                ),
                contentPadding: EdgeInsets.all(5.0),
                actions: <Widget>[
                  new FlatButton(onPressed: () {
                    Navigator.pop(context);
                      },
                      child: new Text("OK")
                  ),
                ],
              );
            }
        )
    );
  }
  Future<Null> succes() async {
    return (
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return new AlertDialog(
                title: new Text("Succès",style: TextStyle(color:Colors.blue),),
                content: new Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Votre message est envoyé avec succès"),
                ),
                contentPadding: EdgeInsets.all(5.0),
                actions: <Widget>[
                  new FlatButton(onPressed: () {
                    Navigator.pop(context);
                  },
                      child: new Text("OK")
                  ),
                ],
              );
            }
        )
    );
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Patientez svp...",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }
}