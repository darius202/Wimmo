import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wimmo/Services/data.dart';
import 'package:wimmo/Services/Servicespage.dart';
import 'package:wimmo/constants.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:wimmo/product.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:wimmo/product_screen.dart';
import 'package:wimmo/transition.dart';
class Questionbody extends StatefulWidget {
  List <Pays> pays;
  List <Ville> ville;
  List <Quartier> quartier;
  List <Mandat> mandat;
  Questionbody({this.pays,this.ville,this.quartier,this.mandat});
  @override
  _QuestionbodyState createState() => _QuestionbodyState();
}

class _QuestionbodyState extends State<Questionbody> {
  List <Pays> _pays= List();
  String _paysselected="";
  List <Ville> _ville=List();
  String _villeselected="";
  List <Ville> filtreVille= List();

  List <Quartier> _quartier=List();
  List <Quartier> filtreQuartier= List();
  String _quartierselected="";

  List <Mandat> _mandat=List();
  String _mandatselected="";

  String paysController;
  String villeController;
  String quartierController;
  String type_bienController;
  String mandatController;
  TextEditingController niveauController;
  TextEditingController superficieController;
  TextEditingController chambreminController;
  TextEditingController chambremaxController;
  _getMandat(){
    TypeBienservices.getMandat().then((value) {
      setState(() {
        _mandat=value;
      });
    });
  }
  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: Container(
        margin: EdgeInsets.all(30.0),
        padding: EdgeInsets.all(10.0),
        child: new Dialog(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Attendez Svp"),
            ],
          ),
        ),
      ),
    );
    if(mandatController=="") {
      Navigator.pop(context);
      echec("Formulaire non valide","Vous devez choisir un type de mandat");
      return;
    }
    else if(type_bienController==""){
      Navigator.pop(context);
      echec("Formulaire non valide","Veuillez choisir le type de bien que vous recherchez");
      return;
    }
    else if(paysController==""){
      Navigator.pop(context);
      echec("Formulaire non valide","Veuillez choisir un pays");
      return;
    }else if(villeController==""){
      Navigator.pop(context);
      echec("Formulaire non valide","Veuillez choisir une ville");
      return;
    }
    else if(quartierController==""){
      Navigator.pop(context);
      echec("Formulaire non valide","Veuillez choisir un quartier");
      return;
    }
    else {
      GetProduct.getProduct(mandatController,type_bienController,paysController,villeController,quartierController).then((value) {
        setState(() {
          produts = value;
        });
        if (produts.length != 0) {
          Navigator.pop(context);
          Navigator.push(context, SlideRightRoute(page: ProductScreen()));
        } else {
          Navigator.pop(context);
          echec("0 résultat",
              "Aucun résultat ne correspond à votre recherche réessayez");
        }
      });
    }
  }

  _getVille(){
    Villeservices.getVille().then((value) {
      setState(() {
        _ville=value;
        filtreVille = value;
      });
    });
  }
  _getPays(){
    Paysservices.getPays().then((value) {
      setState(() {
        _pays =value;
      });
    });
  }
  _getQuartier(){
    Quartierservices.getQuartier().then((value) {
      setState(() {
        _quartier= value;
        filtreQuartier=value;
      });
      print(_quartier.length);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    paysController = "";
    villeController = "";
    quartierController ="";
    type_bienController= "";
    niveauController= TextEditingController();
    mandatController ="";
    superficieController = TextEditingController();
    chambreminController= TextEditingController();
    chambremaxController= TextEditingController();
    _getVille();
    _getPays();
    _getQuartier();
    _getMandat();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(kDefautPadding),
          padding: EdgeInsets.all(kDefautPadding),
          child: Column(
            children: [
              Text("Quel type de mandat recherchez vous?",style: TextStyle(color: Colors.red),),
              RadioButtonGroup(
                  labels: <String>[
                    "Vente ",
                    "Location",
                  ],
                  onSelected: (String selected) {
                    setState(() {
                        mandatController=selected;
                    });
                  }
              ),
              SizedBox(height: 14,),
              Text("Quel type de bien recherchez vous?",style: TextStyle(color: Colors.red),),
              Container(
                margin: EdgeInsets.all(kDefautPadding),
                padding: EdgeInsets.only(left:12.0, right: 12.0),
                child:FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontStyle: FontStyle.normal,fontSize: 14,color: Colors.black),
                        hintText: "Choisissez le type:",
                      ),
                      isEmpty: _mandatselected == '',
                      child: new DropdownButtonHideUnderline(
                        child:ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            isDense: true,
                            value: _mandatselected.isNotEmpty ? _mandatselected : null,
                            onChanged: (String newValue){
                              setState(() {
                                _mandatselected=newValue;
                                type_bienController=newValue;
                              });
                              print(_mandatselected);
                            },
                            items: _mandat.map((Mandat map){
                              return new DropdownMenuItem(
                                value: map.mandat,
                                child: Text(map.mandat),
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
              SizedBox(height: 14,),
              Text("Pays de votre choix",style: TextStyle(color: Colors.red),),
              Container(
                padding: EdgeInsets.only(left:12.0, right: 12.0),
                margin: EdgeInsets.all(kDefautPadding),
                child:  FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontStyle: FontStyle.normal,fontSize: 14,color: Colors.black),
                        hintText: "Choisissez le pays:",
                      ),
                      isEmpty: _paysselected == '',
                      child: new DropdownButtonHideUnderline(
                        child:ButtonTheme(
                          alignedDropdown: true,
                          padding: EdgeInsets.all(10.0),
                          child: DropdownButton(
                            isDense: true,
                            value: _paysselected.isNotEmpty ? _paysselected : null,
                            onChanged: (String newValue){
                              setState(() {
                                int index =int.parse(newValue);
                                paysController=_pays[index-1].intitulepays;
                                _paysselected=newValue;
                                _villeselected ="";
                                _quartierselected="";
                                filtreVille = _ville.where((element) =>
                                (element.codepays.toLowerCase().contains(newValue.toLowerCase()))
                                ).toList();
                              });
                              print(_paysselected);
                            },
                            items: _pays.map((Pays map){
                              return new DropdownMenuItem(
                                value: map.codepays,
                                child: Text(map.intitulepays),
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
              SizedBox(height: 14.0),
              Text("Ville de votre choix",style: TextStyle(color: Colors.red),),
              Container(
                padding: EdgeInsets.only(left:12.0, right: 12.0),
                margin: EdgeInsets.all(kDefautPadding),
                child: FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontStyle: FontStyle.normal,fontSize: 14,color: Colors.black),
                        hintText: "Choisissez la ville:",
                      ),
                      isEmpty: _villeselected == "",
                      child: new DropdownButtonHideUnderline(
                        child:ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            isDense: true,
                            value: _villeselected.isNotEmpty ? _villeselected : null,
                            onChanged: (String newValue){
                              setState(() {
                                if(_paysselected!=""){
                                  _quartierselected ="";
                                  _villeselected=newValue;
                                  int index= int.parse(newValue);
                                  villeController = _ville[index-1].intituleville;

                                  filtreQuartier = _quartier.where((element) =>
                                  (element.codeville.toLowerCase().contains(newValue.toLowerCase()))
                                  ).toList();
                                }else{
                                  _villeselected="";
                                  _quartierselected="";
                                }

                              });
                            },
                            items: filtreVille.map((Ville map){
                              return new DropdownMenuItem(
                                value: map.codeville,
                                child: Text(map.intituleville),
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
              SizedBox(height: 14.0),
              Text("Quartier de votre choix",style: TextStyle(color:Colors.red),),
              Container(
                padding: EdgeInsets.only(left:12.0, right: 12.0),
                margin: EdgeInsets.all(kDefautPadding),
                child: FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontStyle: FontStyle.normal,fontSize: 14,color: Colors.black),
                        hintText: "Choisissez le quartier:",
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
                                if(_villeselected!=""){
                                  _quartierselected=newValue;
                                  int index=int.parse(newValue);
                                  quartierController= _quartier[index-1].intitulequartier;
                                }else{
                                  _villeselected="";
                                }
                              });
                            },
                            items: filtreQuartier.map((Quartier map){
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
              SizedBox(height: 14,),
              Container(
                width:MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                    color: kPrimaryColor
                ),
                child: FlatButton(
                    color: kPrimaryColor,
                    onPressed: (){
                      _onLoading();
                    }, child: Text("Rechercher",style: TextStyle(color: Colors.white),textScaleFactor: 1.2)),
              ),
            ],
          ),
        ),
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
}


AppBar buildAppBar(){
  return AppBar(
    elevation: 0,
    title: Text("Trouvez les meilleures offres"),
    centerTitle: false,
  );
}
