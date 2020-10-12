import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:wimmobeta/Services/data.dart';
import 'package:wimmobeta/Services/Servicespage.dart';
import 'package:wimmobeta/appbar.dart';
import 'package:wimmobeta/constants.dart';
import 'package:wimmobeta/home_page.dart';
import 'package:wimmobeta/navigationDrawer.dart';
import 'package:wimmobeta/product.dart';
import 'package:wimmobeta/transition.dart';


enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  static String id="Admin";
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  MaterialColor active = Colors.blue;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();


//Pays achat variables
  List <Pays> _paysachat = List();
  String _paysachatselected = "";
  String paysachatController;

  //Pays louer variables
  List <Pays> _payslouer = List();
  String _payslouerselected = "";
  String payslouerController;

//Ville achat variables
  List <Ville> _villeachat = List();
  String _villeachatselected = "";
  List <Ville> filtreVilleachat = List();
  String villeachatController;

  //Ville louer variables
  List <Ville> _villelouer = List();
  String _villelouerselected = "";
  List <Ville> filtreVillelouer = List();
  String villelouerController;


//Type de bien variables achat
  List <Mandat> _mandatachat = List();
  String _mandatachatselected = "";
  String type_bienachatController;

  //Type de bien variables louer
  List <Bienlouable> _mandatlouer = List();
  String _mandatlouerselected = "";
  String type_bienlouerController;



  void initState() {
    // TODO: implement initState
    super.initState();
    paysachatController="";
    payslouerController = "";

    villeachatController = "";
    villelouerController = "";

    type_bienachatController = "";
    type_bienlouerController = "";


    _getVille();
    _getPays();
    _getQuartier();
    _getMandat();
  }

  void _onLoading(String mandat,String type,String pays,String ville) {
    _handleSubmit(context);
   GetProduct.getProduct(mandat, type, pays, ville).then((value) {
     setState(() {
       produts=value;
       Filtreproducts=value;
     });
     if(produts.length==0){
       Navigator.pop(context);
       _showMessageInScaffold("Aucun résultat trouvé...");
     }else if(produts.length>0){
       Navigator.pop(context);
       Navigator.push(context, SlideRightRoute(page:  HomePage()));
     }
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:navigationDrawer(),
      appBar: buildAppBar(),
      body:DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF184098),
              elevation: 0,
              bottom: TabBar(
                  labelColor: Colors.redAccent,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.white),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("ACHETER"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("LOUER"),
                      ),
                    ),
                  ]
              ),
            ),
            body: TabBarView(
                children: [
                  _loadScreenachat(),
                  _loadScreenlouer(),
                ]),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                if(DefaultTabController.of(context).index==0){
                  _onLoading("Vente", type_bienachatController, paysachatController, villeachatController);
                }else if(DefaultTabController.of(context).index==1){
                  _onLoading("Location", type_bienlouerController, payslouerController, villelouerController);
                }
                print(
                    'Current Index: ${DefaultTabController.of(context).index
                    }');
              },
              child: Icon(Icons.search,size: 40.0,),
              backgroundColor: kPrimaryColor,
            ),
          );
        }),
      ),
    );
  }

  _getMandat() {
    setState(() {
      _mandatachat = mandat;
      _mandatlouer = louable;
    });
  }

  _getVille() {
    setState(() {
      _villeachat = ville;
      filtreVilleachat = _villeachat;
      _villelouer = ville;
      filtreVillelouer = _villelouer;
    });
  }

  _getPays() {
    setState(() {
      _paysachat = pays;
      _payslouer = pays;
    });
  }

  _getQuartier() {
    setState(() {
      quartierachat = quartier;
      filtreQuartierachat = quartierachat;
    });
  }



  Widget _loadScreenachat() {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                    hintStyle: TextStyle(fontStyle: FontStyle.normal,),
                    hintText: "Type de bien",
                  ),
                  isEmpty: _mandatachatselected == '',
                  child: new DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        isDense: true,
                        value: _mandatachatselected.isNotEmpty
                            ? _mandatachatselected
                            : null,
                        onChanged: (String newValue) {
                          setState(() {
                            _mandatachatselected = newValue;
                            type_bienachatController = newValue;
                          });
                          print(_mandatachatselected);
                        },
                        items: _mandatachat.map((Mandat map) {
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
                    hintStyle: TextStyle(fontStyle: FontStyle.normal,color: Color(0xFFA3A3A3),fontSize: 15),
                    hintText: "Pays",
                  ),
                  isEmpty: _paysachatselected == '',
                  child: new DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      //padding: EdgeInsets.all(10.0),
                      child: DropdownButton(
                        isDense: true,
                        value: _paysachatselected.isNotEmpty ? _paysachatselected : null,
                        onChanged: (String newValue) {
                          setState(() {
                            int index = int.parse(newValue);
                            paysachatController = _paysachat[index - 1].intitulepays;
                            _paysachatselected = newValue;
                            _villeachatselected = "";
                            filtreVilleachat = _villeachat.where((element) =>
                            (element.codepays.toLowerCase().contains(
                                newValue.toLowerCase()))
                            ).toList();
                          });
                          print(_paysachatselected);
                        },
                        items: _paysachat.map((Pays map) {
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
                    hintStyle: TextStyle(fontStyle: FontStyle.normal,color: Color(0xFFA3A3A3),fontSize: 15),
                    hintText: "Ville",
                  ),
                  isEmpty: _villeachatselected == "",
                  child: new DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        isDense: true,
                        value: _villeachatselected.isNotEmpty
                            ? _villeachatselected
                            : null,
                        onChanged: (String newValue) {
                          setState(() {
                            if (_paysachatselected != "") {
                              _villeachatselected = newValue;
                              int index = int.parse(newValue);
                              villeachatController = _villeachat[index - 1].intituleville;

                              filtreQuartierachat = quartierachat.where((element) =>
                              (element.codeville.toLowerCase().contains(
                                  newValue.toLowerCase()))
                              ).toList();
                            } else {
                              _villeachatselected = "";
                            }
                          });
                        },
                        items: filtreVilleachat.map((Ville map) {
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
          //PhoneWidget(),

        ],
      ),
    );
  }

  Widget _loadScreenlouer() {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                    hintStyle: TextStyle(fontStyle: FontStyle.normal,),
                    hintText: "Type de bien",
                  ),
                  isEmpty: _mandatlouerselected == '',
                  child: new DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        isDense: true,
                        value: _mandatlouerselected.isNotEmpty
                            ? _mandatlouerselected
                            : null,
                        onChanged: (String newValue) {
                          setState(() {
                            _mandatlouerselected = newValue;
                            type_bienlouerController = newValue;
                          });
                          print(_mandatlouerselected);
                        },
                        items: _mandatlouer.map((Bienlouable map) {
                          return new DropdownMenuItem(
                            value: map.bien,
                            child: Text(map.bien),
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
                    hintStyle: TextStyle(fontStyle: FontStyle.normal,color: Color(0xFFA3A3A3),fontSize: 15),
                    hintText: "Pays",
                  ),
                  isEmpty: _payslouerselected == '',
                  child: new DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      //padding: EdgeInsets.all(10.0),
                      child: DropdownButton(
                        isDense: true,
                        value: _payslouerselected.isNotEmpty ? _payslouerselected : null,
                        onChanged: (String newValue) {
                          setState(() {
                            int index = int.parse(newValue);
                            payslouerController = _payslouer[index - 1].intitulepays;
                            _payslouerselected = newValue;
                            _villelouerselected = "";
                            filtreVillelouer = _villelouer.where((element) =>
                            (element.codepays.toLowerCase().contains(
                                newValue.toLowerCase()))
                            ).toList();
                          });
                          print(_payslouerselected);
                        },
                        items: _payslouer.map((Pays map) {
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
                    hintStyle: TextStyle(fontStyle: FontStyle.normal,color: Color(0xFFA3A3A3),fontSize: 15),
                    hintText: "Ville",
                  ),
                  isEmpty: _villelouerselected == "",
                  child: new DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        isDense: true,
                        value: _villelouerselected.isNotEmpty
                            ? _villelouerselected
                            : null,
                        onChanged: (String newValue) {
                          setState(() {
                            if (_payslouerselected != "") {
                              _villelouerselected = newValue;
                              int index = int.parse(newValue);
                              villelouerController = _villelouer[index - 1].intituleville;

                              filtreQuartierachat = quartierachat.where((element) =>
                              (element.codeville.toLowerCase().contains(
                                  newValue.toLowerCase()))
                              ).toList();
                            } else {
                              _villelouerselected = "";
                            }
                          });
                        },
                        items: filtreVillelouer.map((Ville map) {
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
          //PhoneWidget(),
        ],
      ),
    );
  }

  void _showMessageInScaffold(String message) {
    try {
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(message, style: TextStyle(color: Colors.white,fontSize: 18),),
            duration: Duration(seconds: 2, milliseconds: 500),
          )
      );
    } on Exception catch (e, s) {
      print(s);
    }
  }

  Future<void> _handleSubmit(BuildContext context) async {
    try {
      Dialogs.showLoadingDialog(context, _keyLoader);//invoking login
      Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();//close the dialoge
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) =>  HomePage(),
      )
      );
    } catch (error) {
      print(error);
    }
  }
}




class PhoneWidget extends StatefulWidget {
  @override
  _PhoneWidgetState createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  String _selectedCountryCode;
  List<String> _countryCodes = ['+91', '+23'];

  @override
  Widget build(BuildContext context) {
    var countryDropDown = Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      height: 45.0,
      margin: const EdgeInsets.all(3.0),
      //width: 300.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            value: _selectedCountryCode,
            items: _countryCodes.map((String value) {
              return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(
                    value,
                    style: TextStyle(fontSize: 12.0),
                  ));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCountryCode = value;
              });
            },
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
    return Container(
      width: double.infinity,
      margin: new EdgeInsets.only(top: 10.0, bottom: 10.0, right: 3.0),
      color: Colors.white,
      child: new TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
        },
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
            contentPadding: const EdgeInsets.all(12.0),
            border: new OutlineInputBorder(
                borderSide:
                new BorderSide(color: const Color(0xFFE0E0E0), width: 0.1)),
            fillColor: Colors.white,
            prefixIcon: countryDropDown,
            hintText: 'Phone Number',
            labelText: 'Phone Number'),
      ),
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

