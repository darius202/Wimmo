import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:wimmobeta/constants.dart';
import 'package:wimmobeta/details_screen.dart';
import 'package:wimmobeta/product.dart';
import 'package:wimmobeta/transition.dart';

import 'Services/data.dart';
class DataBody extends StatefulWidget {

  @override
  _DataBodyState createState() => _DataBodyState();
}

class _DataBodyState extends State<DataBody> {

  static const String parcelle = "Parcelle";
  static const String villa = "Maison ou Villa";
  static const String appartement = "Appartement";
  static const String bureau = "Bureau ou Boutique";

  String _quartierselected = "";
  String quartierController;
  String superficieminController="";
  String prixminController="";
  String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value;
    }
  }

  String activetrie="";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0,right: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: CheckboxGroup(
                    labels: <String>[
                      "Cochez pour filtrer",
                    ],
                    labelStyle: TextStyle(color: kPrimaryColor,fontSize: 16,fontWeight: FontWeight.bold),
                    onSelected: (List<String> checked) {
                      setState(() {
                        activetrie=checked.toString();
                       if(activetrie!="[Cochez pour filtrer]"){
                         Filtreproducts=produts;
                       }
                      });
                    }
                ),
              ),
              activetrie=="[Cochez pour filtrer]"?_loadOptionachat():Container(),
            ],
          ),
          SizedBox(height: 12,),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top:10.0),
                itemCount:Filtreproducts.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, SlideRightRoute(page:  DetailsScreen(Filtreproducts[index])));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Card(
                        margin: EdgeInsets.all(3.0),
                        borderOnForeground: true,
                        elevation: 3.0,
                        color: Colors.white,
                        child: Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Stack(
                                      children: <Widget>[
                                        Filtreproducts[index].image1!=null ?
                                        Image.network(
                                          "https://gerestock.com/immo/images/"+ Filtreproducts[index].image1,
                                          width: 100,
                                          height: 100,
                                        ):Container(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        Filtreproducts[index].type_bien !=null? Filtreproducts[index].type_bien :'',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color:kPrimaryColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(width: 8.0,),
                                      Filtreproducts[index].nbetage!=null ?Text(
                                        Filtreproducts[index].nbetage !=null? Filtreproducts[index].nbetage :'',
                                        style: TextStyle(
                                            color:Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ):Text("")
                                    ],
                                  ),
                                  Filtreproducts[index].type_bien !=parcelle?
                                  SizedBox(height: 8.0,):Container(),
                                  Filtreproducts[index].type_bien==villa?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                     Image.asset('assets/salon.png',fit: BoxFit.cover,),
                                      SizedBox(width: 5.0,),
                                     Text(Filtreproducts[index].nbsalon+" salon"),
                                      SizedBox(width: 8.0,),
                                     Image.asset('assets/chambre.png',fit: BoxFit.cover,),
                                      SizedBox(width: 5.0,),
                                      Text(Filtreproducts[index].nbchambre+" chambre"),
                                    ],
                                  ):Container(),
                                  Filtreproducts[index].type_bien==appartement?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Image.asset('assets/salon.png',fit: BoxFit.cover,),
                                      SizedBox(width: 5.0,),
                                      Text(Filtreproducts[index].nbsalon+" salon"),
                                      SizedBox(width: 8.0,),
                                      Image.asset('assets/chambre.png',fit: BoxFit.cover,),
                                      SizedBox(width: 5.0,),
                                      Text(Filtreproducts[index].nbchambre+" chambre"),
                                    ],
                                  ):Container(),
                                  Filtreproducts[index].type_bien !="Parcelle"?
                                  SizedBox(height: 8.0,):Container(),
                                  Filtreproducts[index].type_bien==villa?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                     Image.asset('assets/cuisine.png',fit: BoxFit.cover,),
                                      SizedBox(width: 5.0,),
                                     Text(Filtreproducts[index].nbcuisine+" cuisine"),
                                      SizedBox(width: 8.0,),
                                      Image.asset('assets/bain.png',fit: BoxFit.cover,),
                                      SizedBox(width: 5.0,),
                                      Text(Filtreproducts[index].nbsalledebain+" douche"),
                                    ],
                                  ):Container(),
                                  Filtreproducts[index].type_bien==appartement?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Image.asset('assets/cuisine.png',fit: BoxFit.cover,),
                                      SizedBox(width: 5.0,),
                                      Text(Filtreproducts[index].nbcuisine+" cuisine"),
                                      SizedBox(width: 8.0,),
                                      Image.asset('assets/bain.png',fit: BoxFit.cover,),
                                      SizedBox(width: 5.0,),
                                      Text(Filtreproducts[index].nbsalledebain+" douche"),
                                    ],
                                  ):Container(),
                                  Filtreproducts[index].type_bien==bureau?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Image.asset('assets/bain.png',fit: BoxFit.cover,),
                                      SizedBox(width: 5.0,),
                                      Text(Filtreproducts[index].nbsalon+" douche"),
                                      SizedBox(width: 8.0,),
                                      Image.asset('assets/chambre.png',fit: BoxFit.cover,),
                                      SizedBox(width: 5.0,),
                                      Text(Filtreproducts[index].nbchambre+" pièce"),
                                    ],
                                  ):Container(),
                                  SizedBox(height: 8.0,),
                                  Filtreproducts[index].type_bien==villa?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Filtreproducts[index].nbboutique!=null?
                                      Text(Filtreproducts[index].nbboutique+" Boutique",style:TextStyle(fontSize:12,color:kPrimaryColor)):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbmagasin!=null?
                                      Text(Filtreproducts[index].nbmagasin+" Magasin",style:TextStyle(fontSize:12,color:kPrimaryColor)):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbhall!=null?
                                      Text(Filtreproducts[index].nbhall+" Hall",style:TextStyle(fontSize:12,color:kPrimaryColor)):Container(),
                                    ],
                                  ):Container(),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        produts[index].prix!=null? Filtreproducts[index].prix+" Fcfa ":'',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        Filtreproducts[index].negoce!=null? Filtreproducts[index].negoce:'',
                                        style: TextStyle(
                                            color: kTextLigthtColor,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.location_on),
                                      Text(
                                        Filtreproducts[index].quartier!=null? Filtreproducts[index].quartier+',':'',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal
                                        ),
                                      ),
                                      Text(
                                        Filtreproducts[index].ville!=null? Filtreproducts[index].ville+'-':'',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal
                                        ),
                                      ),
                                      Text(
                                        Filtreproducts[index].pays!=null? Filtreproducts[index].pays:'',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(height: 40,)
        ],
      ),
    );
  }

  Widget _loadOptionachat() {
          return Column(
            children: [
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    right: BorderSide(width: 0.5, color: Colors.grey),
                    left: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                ),
                height: 45.0,
                margin: const EdgeInsets.only(top:10.0,right: 20.0, left: 20.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Flexible(
                      child: new TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "  Prix",
                              contentPadding: EdgeInsets.all(10)
                          ),
                        onChanged: (String string){
                          setState(() {
                            prixminController=string;
                            Filtreproducts = produts.where((element) =>
                            (element.prix.toLowerCase().contains(string.toLowerCase()))).toList();
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    new Flexible(
                      child: new TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Superficie m2",
                              contentPadding: EdgeInsets.all(10)
                          ),
                        onChanged: (String string){
                          setState(() {
                            superficieminController=string;
                              Filtreproducts = produts.where((element) =>
                              (element.superficie.toLowerCase().contains(string.toLowerCase()))).toList();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    right: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                ),
                height: 45.0,
                margin: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                child: FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontStyle: FontStyle.normal,color: kTextLigthtColor,fontSize: 15),
                        hintText: "Quartier",
                      ),
                      isEmpty: _quartierselected == '',
                      child: new DropdownButtonHideUnderline(
                        child:ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            isDense: true,
                            value: _quartierselected.isNotEmpty ? _quartierselected : null,
                            onChanged: (String newValue){
                              setState(() {
                                  _quartierselected=newValue;
                                  int index=int.parse(newValue);
                                  quartierController= quartierachat[index-1].intitulequartier;
                                  Filtreproducts = produts.where((element) =>
                                  (element.quartier.toLowerCase().contains(quartierController.toLowerCase()))).toList();
                              });
                            },
                            items: filtreQuartierachat.map((Quartier map){
                              return new DropdownMenuItem(
                                value: map.codequartier,
                                child: Text(map.intitulequartier),
                              );
                            }
                            ).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
      }
}

