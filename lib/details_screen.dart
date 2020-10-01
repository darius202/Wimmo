import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:wimmobeta/constants.dart';
import 'package:wimmobeta/photos.dart';
import 'package:wimmobeta/product.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wimmobeta/signalbien.dart';
import 'package:wimmobeta/transition.dart';
class DetailsScreen extends StatefulWidget {
  Product annonce;
  DetailsScreen(Product annonce){
    this.annonce=annonce;
  }
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  static const String parcelle = "Parcelle";
  static const String villa = "Maison ou Villa";
  static const String appartement = "Appartement";
  static const String bureau = "Bureau ou Boutique";

  String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(top:20.0),
              child: SizedBox(
                  height: 200.0,
                  child: Carousel(
                    images: [
                      NetworkImage(widget.annonce.image1.isNotEmpty?"https://gerestock.com/immo/images/"+widget.annonce.image1:"",),
                      NetworkImage(widget.annonce.image2.isNotEmpty?"https://gerestock.com/immo/images/"+widget.annonce.image2:""),
                      NetworkImage(widget.annonce.image3.isNotEmpty?"https://gerestock.com/immo/images/"+widget.annonce.image3:""),
                      NetworkImage(widget.annonce.image4.isNotEmpty?"https://gerestock.com/immo/images/"+widget.annonce.image4:""),
                    ],
                    dotSize: 6.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.lightGreenAccent,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.purple.withOpacity(0.5),
                    borderRadius: false,
                  )
              ),
            ),
            GestureDetector(
              onTap:(){
                Navigator.push(context, SlideRightRoute(page:  Photo(widget.annonce)));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Text("voir les photos", style: TextStyle(
                    color: kPrimaryColor, decoration: TextDecoration.underline,),)
                  ]
              ),
            ),
            SizedBox(height: 18,),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.annonce.type_bien !=null? widget.annonce.type_bien +" à "+widget.annonce.ville+"  ("+widget.annonce.type_mandat+")" :'',
                          style: TextStyle(
                              fontSize: 18.0,
                              color:kPrimaryColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          widget.annonce.type_bien !=bureau? widget.annonce.nbetage :'',
                          style: TextStyle(
                              color:kTextLigthtColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            SizedBox(height: 8.0,),
            Container(
              margin: EdgeInsets.only(left:20.0,right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.annonce.prix!=null? moneyFormat(widget.annonce.prix)+" Fcfa":'',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal
                          ),
                        ),
                        Text(
                          widget.annonce.negoce!=null? " "+widget.annonce.negoce:'',
                          style: TextStyle(
                              color: kTextLigthtColor,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _loadScreen(),
          ],
        ),
      ),
    );
  }
  Widget _loadScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          widget.annonce.type_mandat=="Vente"?
          _loadOptionachat():_loadOptionlouer(),
        ],
      ),
    );
  }
  Widget _loadOptionachat() {
    switch (widget.annonce.type_bien) {
      case parcelle:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/dim.png",
                  height: 40,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.superficie+" m2",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                SizedBox(width: 20.0,),
                Image.asset("assets/admi.png",),
                SizedBox(width: 5.0,),
                Text(widget.annonce.situationadministrative,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
              ],
            ),
            SizedBox(height: 8.0,),
            Container(
              margin: EdgeInsets.only(left:20.0,right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Row(
                    children: [
                      Icon(Icons.location_on,),
                      Text(
                        widget.annonce.quartier!=null?  widget.annonce.quartier+',':'',
                        style: TextStyle(
                            color: kTextLigthtColor,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal
                        ),
                      ),
                      Text(
                        widget.annonce.ville!=null?  widget.annonce.ville+'-':'',
                        style: TextStyle(
                            color: kTextLigthtColor,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal
                        ),
                      ),
                      Text(
                        widget.annonce.pays!=null?  widget.annonce.pays:'',
                        style: TextStyle(
                            color:kTextLigthtColor,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Icon(Icons.phone,),
                      SizedBox(width: 5.0,),
                      Text(
                        widget.annonce.admincontact!=null?  widget.annonce.admincontact:'',
                        style: TextStyle(
                            color:kTextLigthtColor,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal
                        ),
                      ),
                    ],
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Descriptif",style:TextStyle(color:kPrimaryColor,fontSize:18,fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      children:[
                Text(widget.annonce.description,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,),
                     ),
                           ]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.3,
              decoration: new BoxDecoration(
                color: kPrimaryColor,
              ),
              child: FlatButton(
                onPressed: (){
                  launchWhatsApp(widget.annonce.admincontact,"Annonce wimmobeta \n\n"+widget.annonce.intitule_bien+" \nLocalisation: "+widget.annonce.pays+"-"+widget.annonce.ville+"-"+widget.annonce.quartier
                      +"\nType du bien: "+widget.annonce.type_bien+"\n"+"prix: "+widget.annonce.prix+" "+widget.annonce.negoce+"\n\nPrêt pour les négociations"+"\n https://gerestock.com/immo/images/"+ widget.annonce.image1);
                },
                child: Text("CONTACTER",
                  style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: "Monteserrat"),),
              ),
            ),
            SizedBox(height: 10.0,),
            GestureDetector(
              onTap:(){
                Navigator.push(context, SlideRightRoute(page: Signaler(widget.annonce)));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text("Signaler cette annonce", style: TextStyle(
                        color: Colors.red, decoration: TextDecoration.underline,fontSize: 18),)
                  ]
              ),
            ),
            SizedBox(height: 10.0,),
          ],
        );
        break;
      case villa:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/dim.png",
                  height: 40,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.superficie+" m2",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                SizedBox(width: 20.0,),
                Image.asset("assets/admi.png",),
                SizedBox(width: 5.0,),
                Text(widget.annonce.situationadministrative,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
              ],
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/salon.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbsalon+" salon",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
                SizedBox(width: 8.0,),
                Image.asset('assets/chambre.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbchambre+" chambre",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
                SizedBox(width: 5.0,),
                Image.asset('assets/cuisine.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbcuisine+" cuisine",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
                SizedBox(width: 5.0,),
                Image.asset('assets/bain.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbsalledebain+" douche",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,),
                Text(
                  widget.annonce.quartier!=null?  widget.annonce.quartier+',':'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                Text(
                  widget.annonce.ville!=null?  widget.annonce.ville+'-':'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                Text(
                  widget.annonce.pays!=null?  widget.annonce.pays:'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                SizedBox(width: 5.0,),
                Icon(Icons.phone,),
                SizedBox(width: 5.0,),
                Text(
                  widget.annonce.admincontact!=null?  widget.annonce.admincontact:'',
                  style: TextStyle(
                      color:kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0,),

                  Text("Descriptif",style:TextStyle(color:kPrimaryColor,fontSize:18,fontWeight: FontWeight.bold),
                      maxLines: 6),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                        children:[
                          Text(widget.annonce.description,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Caractéristiques",style:TextStyle(color:kPrimaryColor,fontSize:18,fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Nouvelle construction:",style:TextStyle(color:kTextLigthtColor)
                        ),
                        widget.annonce.newconstruire!=""? Text(widget.annonce.newconstruire,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Dépendance/Boyerie:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.dependance!=""? Text(widget.annonce.dependance,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Garage:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.garage!=""? Text(widget.annonce.garage,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Piscine:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.piscine!=""? Text(widget.annonce.piscine,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),

                Container(
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Jardin:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.jardin!=""? Text(widget.annonce.jardin,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Toilette visiteur:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.toilettevisiteur!=""? Text(widget.annonce.toilettevisiteur,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Débarras:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.debarras!=""? Text(widget.annonce.debarras,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Arrière-cours:",style:TextStyle(color:kTextLigthtColor)
                        ),
                        widget.annonce.arrierecours!=""? Text(widget.annonce.arrierecours,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Terasse/Balcon:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.balcon!=""? Text(widget.annonce.balcon,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.3,
              decoration: new BoxDecoration(
                color: kPrimaryColor,
              ),
              child: FlatButton(
                onPressed: (){
                  launchWhatsApp(widget.annonce.admincontact,"Annonce wimmobeta \n\n"+widget.annonce.intitule_bien+" \nLocalisation: "+widget.annonce.pays+"-"+widget.annonce.ville+"-"+widget.annonce.quartier
                      +"\nType du bien: "+widget.annonce.type_bien+"\n"+"prix: "+widget.annonce.prix+" "+widget.annonce.negoce+"\n\nPrêt pour les négociations"+"\n https://gerestock.com/immo/images/"+ widget.annonce.image1);
                },
                child: Text("CONTACTER",
                  style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: "Monteserrat"),),
              ),
            ),
            SizedBox(height: 10.0,),
            GestureDetector(
              onTap:(){
                Navigator.push(context, SlideRightRoute(page: Signaler(widget.annonce)));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text("Signaler cette annonce", style: TextStyle(
                      color: Colors.red, decoration: TextDecoration.underline,fontSize: 18),)
                  ]
              ),
            ),
            SizedBox(height: 40.0,),
          ],
        );
        break;
      default:
        return Container();
    }
  }
  Widget _loadOptionlouer() {
    switch (widget.annonce.type_bien) {
      case appartement:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/dim.png",
                  height: 40,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.superficie+" m2",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                SizedBox(width: 20.0,),
                Image.asset("assets/admi.png",),
                SizedBox(width: 5.0,),
                Text(widget.annonce.situationadministrative,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
              ],
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/salon.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbsalon+" salon",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
                SizedBox(width: 8.0,),
                Image.asset('assets/chambre.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbchambre+" chambre",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
                SizedBox(width: 5.0,),
                Image.asset('assets/cuisine.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbcuisine+" cuisine",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
                SizedBox(width: 5.0,),
                Image.asset('assets/bain.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbsalledebain+" douche",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,),
                Text(
                  widget.annonce.quartier!=null?  widget.annonce.quartier+',':'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                Text(
                  widget.annonce.ville!=null?  widget.annonce.ville+'-':'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                Text(
                  widget.annonce.pays!=null?  widget.annonce.pays:'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                SizedBox(width: 5.0,),
                Icon(Icons.phone,),
                SizedBox(width: 5.0,),
                Text(
                  widget.annonce.admincontact!=null?  widget.annonce.admincontact:'',
                  style: TextStyle(
                      color:kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Descriptif",style:TextStyle(color:kPrimaryColor,fontSize:18,fontWeight: FontWeight.bold)),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                        children:[
                          Text(widget.annonce.description,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Caractéristiques",style:TextStyle(color:kPrimaryColor,fontSize:18,fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Nouvelle construction:",style:TextStyle(color:kTextLigthtColor)
                        ),
                        widget.annonce.newconstruire!=""? Text(widget.annonce.newconstruire,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Compteur personnel:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.compteurperso!=""? Text(widget.annonce.compteurperso,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Garage:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.garage!=""? Text(widget.annonce.garage,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Toilette visiteur:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.toilettevisiteur!=""? Text(widget.annonce.toilettevisiteur,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Débarras:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.debarras!=""? Text(widget.annonce.debarras,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Arrière-cours:",style:TextStyle(color:kTextLigthtColor)
                        ),
                        widget.annonce.arrierecours!=""? Text(widget.annonce.arrierecours,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Terasse/Balcon:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.balcon!=""? Text(widget.annonce.balcon,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Ascenceur:",style:TextStyle(color:kTextLigthtColor)
                        ),
                        widget.annonce.ascensseur!=""? Text(widget.annonce.ascensseur,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Meublé:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.meuble!=""? Text(widget.annonce.meuble,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.3,
              decoration: new BoxDecoration(
                color: kPrimaryColor,
              ),
              child: FlatButton(
                onPressed: (){
                  launchWhatsApp(widget.annonce.admincontact,"Annonce wimmobeta \n\n"+widget.annonce.intitule_bien+" \nLocalisation: "+widget.annonce.pays+"-"+widget.annonce.ville+"-"+widget.annonce.quartier
                      +"\nType du bien: "+widget.annonce.type_bien+"\n"+"prix: "+widget.annonce.prix+" "+widget.annonce.negoce+"\n\nPrêt pour les négociations"+"\n https://gerestock.com/immo/images/"+ widget.annonce.image1);
                },
                child: Text("CONTACTER",
                  style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: "Monteserrat"),),
              ),
            ),
            SizedBox(height: 10.0,),
            GestureDetector(
              onTap:(){
                Navigator.push(context, SlideRightRoute(page: Signaler(widget.annonce)));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text("Signaler cette annonce", style: TextStyle(
                        color: Colors.red, decoration: TextDecoration.underline,fontSize: 18),)
                  ]
              ),
            ),
            SizedBox(height: 40.0,),
          ],
        );
        break;
      case villa:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/dim.png",
                  height: 40,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.superficie+" m2",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                SizedBox(width: 20.0,),
                Image.asset("assets/admi.png",),
                SizedBox(width: 5.0,),
                Text(widget.annonce.situationadministrative,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
              ],
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/salon.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbsalon+" salon",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
                SizedBox(width: 8.0,),
                Image.asset('assets/chambre.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbchambre+" chambre",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
                SizedBox(width: 5.0,),
                Image.asset('assets/cuisine.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbcuisine+" cuisine",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
                SizedBox(width: 5.0,),
                Image.asset('assets/bain.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbsalledebain+" douche",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,),
                Text(
                  widget.annonce.quartier!=null?  widget.annonce.quartier+',':'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                Text(
                  widget.annonce.ville!=null?  widget.annonce.ville+'-':'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                Text(
                  widget.annonce.pays!=null?  widget.annonce.pays:'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                SizedBox(width: 5.0,),
                Icon(Icons.phone,),
                SizedBox(width: 5.0,),
                Text(
                  widget.annonce.admincontact!=null?  widget.annonce.admincontact:'',
                  style: TextStyle(
                      color:kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Descriptif",style:TextStyle(color:kPrimaryColor,fontSize:18,fontWeight: FontWeight.bold)),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                        children:[
                          Text(widget.annonce.description,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Caractéristiques",style:TextStyle(color:kPrimaryColor,fontSize:18,fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Nouvelle construction:",style:TextStyle(color:kTextLigthtColor)
                        ),
                        widget.annonce.newconstruire!=""? Text(widget.annonce.newconstruire,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Dépendance/Boyerie:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.dependance!=""? Text(widget.annonce.dependance,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Garage:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.garage!=""? Text(widget.annonce.garage,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Piscine:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.piscine!=""? Text(widget.annonce.piscine,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),

                Container(
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Jardin:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.jardin!=""? Text(widget.annonce.jardin,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Toilette visiteur:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.toilettevisiteur!=""? Text(widget.annonce.toilettevisiteur,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Débarras:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.debarras!=""? Text(widget.annonce.debarras,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Arrière-cours:",style:TextStyle(color:kTextLigthtColor)
                        ),
                        widget.annonce.arrierecours!=""? Text(widget.annonce.arrierecours,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Terasse/Balcon:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.balcon!=""? Text(widget.annonce.balcon,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.3,
              decoration: new BoxDecoration(
                color: kPrimaryColor,
              ),
              child: FlatButton(
                onPressed: (){
                  launchWhatsApp(widget.annonce.admincontact,"Annonce wimmobeta \n\n"+widget.annonce.intitule_bien+" \nLocalisation: "+widget.annonce.pays+"-"+widget.annonce.ville+"-"+widget.annonce.quartier
                      +"\nType du bien: "+widget.annonce.type_bien+"\n"+"prix: "+widget.annonce.prix+" "+widget.annonce.negoce+"\n\nPrêt pour les négociations"+"\n https://gerestock.com/immo/images/"+ widget.annonce.image1);
                },
                child: Text("CONTACTER",
                  style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: "Monteserrat"),),
              ),
            ),
            SizedBox(height: 10.0,),
            GestureDetector(
              onTap:(){
                Navigator.push(context, SlideRightRoute(page: Signaler(widget.annonce)));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text("Signaler cette annonce", style: TextStyle(
                        color: Colors.red, decoration: TextDecoration.underline,fontSize: 18),)
                  ]
              ),
            ),
            SizedBox(height: 40.0,),
          ],
        );
        break;
      case bureau:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/dim.png",
                  height: 40,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.superficie+" m2",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                SizedBox(width: 20.0,),
                Image.asset("assets/admi.png",),
                SizedBox(width: 5.0,),
                Text(widget.annonce.situationadministrative,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
              ],
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/chambre.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbchambre+" pièce",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
                SizedBox(width: 5.0,),
                Image.asset('assets/bain.png',fit: BoxFit.cover,),
                SizedBox(width: 5.0,),
                Text(widget.annonce.nbsalledebain+" douche",style: TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on,),
                Text(
                  widget.annonce.quartier!=null?  widget.annonce.quartier+',':'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                Text(
                  widget.annonce.ville!=null?  widget.annonce.ville+'-':'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                Text(
                  widget.annonce.pays!=null?  widget.annonce.pays:'',
                  style: TextStyle(
                      color: kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
                SizedBox(width: 5.0,),
                Icon(Icons.phone,),
                SizedBox(width: 5.0,),
                Text(
                  widget.annonce.admincontact!=null?  widget.annonce.admincontact:'',
                  style: TextStyle(
                      color:kTextLigthtColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Descriptif",style:TextStyle(color:kPrimaryColor,fontSize:18,fontWeight: FontWeight.bold)),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                        children:[
                          Text(widget.annonce.description,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Caractéristiques",style:TextStyle(color:kPrimaryColor,fontSize:18,fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Nouvelle construction:",style:TextStyle(color:kTextLigthtColor)
                        ),
                        widget.annonce.newconstruire!=""? Text(widget.annonce.newconstruire,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Compteur personnel:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.compteurperso!=""? Text(widget.annonce.compteurperso,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Garage:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.garage!=""? Text(widget.annonce.garage,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Toilette visiteur:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.toilettevisiteur!=""? Text(widget.annonce.toilettevisiteur,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Débarras:",style:TextStyle(color:kTextLigthtColor,)
                        ),
                        widget.annonce.debarras!=""? Text(widget.annonce.debarras,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                        SizedBox(width: 5.0,),
                        Text("Arrière-cours:",style:TextStyle(color:kTextLigthtColor)
                        ),
                        widget.annonce.arrierecours!=""? Text(widget.annonce.arrierecours,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left:20.0,right: 20.0),
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ascenceur:",style:TextStyle(color:kTextLigthtColor)
                        ),
                        widget.annonce.ascensseur!=""? Text(widget.annonce.ascensseur,style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)
                        ):Text("Non",style:TextStyle(color:kTextLigthtColor,fontWeight: FontWeight.bold,)),
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.3,
              decoration: new BoxDecoration(
                color: kPrimaryColor,
              ),
              child: FlatButton(
                onPressed: (){
                  launchWhatsApp(widget.annonce.admincontact,"Annonce wimmobeta \n\n"+widget.annonce.intitule_bien+" \nLocalisation: "+widget.annonce.pays+"-"+widget.annonce.ville+"-"+widget.annonce.quartier
                      +"\nType du bien: "+widget.annonce.type_bien+"\n"+"prix: "+widget.annonce.prix+" "+widget.annonce.negoce+"\n\nPrêt pour les négociations"+"\n https://gerestock.com/immo/images/"+ widget.annonce.image1);
                },
                child: Text("CONTACTER",
                  style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: "Monteserrat"),),
              ),
            ),
            SizedBox(height: 10.0,),
            GestureDetector(
              onTap:(){
                Navigator.push(context, SlideRightRoute(page: Signaler(widget.annonce)));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text("Signaler cette annonce", style: TextStyle(
                        color: Colors.red, decoration: TextDecoration.underline,fontSize: 18),)
                  ]
              ),
            ),
            SizedBox(height: 40.0,),
          ],
        );
        break;
      default:
        return Container();
    }
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