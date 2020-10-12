import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:wimmobeta/constants.dart';
import 'package:wimmobeta/details_screen.dart';
import 'package:wimmobeta/product.dart';
import 'package:wimmobeta/transition.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
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
  static const String lien ="https://afriqueimmobilier.net/immo/images/";
  Quartier selectedquartier;
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
                                        CachedNetworkImage(
                                          imageUrl: lien+Filtreproducts[index].image1,
                                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                                              CircularProgressIndicator(value: downloadProgress.progress),
                                          errorWidget: (context, url, error) => Icon(Icons.error,color:Colors.red),
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
                                      Filtreproducts[index].nbsalon.isNotEmpty?
                                     Image.asset('assets/salon.png',fit: BoxFit.cover,):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbsalon.isNotEmpty?
                                     Text(Filtreproducts[index].nbsalon+" salon"):Container(),
                                      SizedBox(width: 8.0,),
                                      Filtreproducts[index].nbchambre.isNotEmpty?
                                     Image.asset('assets/chambre.png',fit: BoxFit.cover,):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbchambre.isNotEmpty?
                                      Text(Filtreproducts[index].nbchambre+" chambre"):Container(),
                                    ],
                                  ):Container(),
                                  Filtreproducts[index].type_bien==appartement?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Filtreproducts[index].nbsalon.isNotEmpty?
                                      Image.asset('assets/salon.png',fit: BoxFit.cover,):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbsalon.isNotEmpty?
                                      Text(Filtreproducts[index].nbsalon+" salon"):Container(),
                                      SizedBox(width: 8.0,),
                                      Filtreproducts[index].nbchambre.isNotEmpty?
                                      Image.asset('assets/chambre.png',fit: BoxFit.cover,):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbchambre.isNotEmpty?
                                      Text(Filtreproducts[index].nbchambre+" chambre"):Container(),
                                    ],
                                  ):Container(),
                                  Filtreproducts[index].type_bien !="Parcelle"?
                                  SizedBox(height: 8.0,):Container(),
                                  Filtreproducts[index].type_bien==villa?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Filtreproducts[index].nbcuisine.isNotEmpty?
                                     Image.asset('assets/cuisine.png',fit: BoxFit.cover,):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbcuisine.isNotEmpty?
                                     Text(Filtreproducts[index].nbcuisine+" cuisine"):Container(),
                                      SizedBox(width: 8.0,),
                                      Filtreproducts[index].nbsalledebain.isNotEmpty?
                                      Image.asset('assets/bain.png',fit: BoxFit.cover,):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbsalledebain.isNotEmpty?
                                      Text(Filtreproducts[index].nbsalledebain+" douche"):Container(),
                                    ],
                                  ):Container(),
                                  Filtreproducts[index].type_bien==appartement?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Filtreproducts[index].nbcuisine.isNotEmpty?
                                      Image.asset('assets/cuisine.png',fit: BoxFit.cover,):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbcuisine.isNotEmpty?
                                      Text(Filtreproducts[index].nbcuisine+" cuisine"):Container(),
                                      SizedBox(width: 8.0,),
                                      Filtreproducts[index].nbsalledebain.isNotEmpty?
                                      Image.asset('assets/bain.png',fit: BoxFit.cover,):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbsalledebain.isNotEmpty?
                                      Text(Filtreproducts[index].nbsalledebain+" douche"):Container(),
                                    ],
                                  ):Container(),
                                  Filtreproducts[index].type_bien==bureau?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Filtreproducts[index].nbsalledebain.isNotEmpty?
                                      Image.asset('assets/bain.png',fit: BoxFit.cover,):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbsalledebain.isNotEmpty?
                                      Text(Filtreproducts[index].nbsalledebain+" douche"):Container(),
                                      SizedBox(width: 8.0,),
                                      Filtreproducts[index].nbchambre.isNotEmpty?
                                      Image.asset('assets/chambre.png',fit: BoxFit.cover,):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbchambre.isNotEmpty?
                                      Text(Filtreproducts[index].nbchambre+" pièce"):Container(),
                                    ],
                                  ):Container(),
                                  SizedBox(height: 8.0,),
                                  Filtreproducts[index].type_bien==villa?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Filtreproducts[index].nbboutique.isNotEmpty?
                                      Text(Filtreproducts[index].nbboutique+" Boutique",style:TextStyle(fontSize:12,color:kPrimaryColor)):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbmagasin.isNotEmpty?
                                      Text(Filtreproducts[index].nbmagasin+" Magasin",style:TextStyle(fontSize:12,color:kPrimaryColor)):Container(),
                                      SizedBox(width: 5.0,),
                                      Filtreproducts[index].nbhall.isNotEmpty?
                                      Text(Filtreproducts[index].nbhall+" Hall",style:TextStyle(fontSize:12,color:kPrimaryColor)):Container(),
                                    ],
                                  ):Container(),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        produts[index].prix!=null? moneyFormat(Filtreproducts[index].prix)+" Fcfa ":'',
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
                                      Icon(Icons.location_on,size: 12,),
                                      Text(
                                        Filtreproducts[index].quartier!=null? Filtreproducts[index].quartier+',':'',
                                        style: TextStyle(
                                          fontSize:10,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal
                                        ),
                                      ),
                                      Text(
                                        Filtreproducts[index].ville!=null? Filtreproducts[index].ville+'-':'',
                                        style: TextStyle(
                                            fontSize:11,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal
                                        ),
                                      ),
                                      Text(
                                        Filtreproducts[index].pays!=null? Filtreproducts[index].pays:'',
                                        style: TextStyle(
                                            fontSize:11,
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
              new  SearchableDropdown(
                  hint: Text('Quartier'),
                  items: filtreQuartierachat.map((item) {
                    return new DropdownMenuItem<Quartier>(
                        child: Text(item.intitulequartier), value: item);
                  }).toList(),
                  isExpanded: true,
                  value: selectedquartier,
                  isCaseSensitiveSearch: true,
                  searchHint: new Text(
                    'Selectionnez un quartier ',
                    style: new TextStyle(fontSize: 20),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedquartier = value;
                      quartierController=selectedquartier.intitulequartier;
                      Filtreproducts = produts.where((element) =>
                      (element.quartier.toLowerCase().contains(quartierController.toLowerCase()))).toList();
                    });
                  },
                ),
            ],
          );
      }
}

