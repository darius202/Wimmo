import 'package:wimmo/Services/Servicespage.dart';
import 'package:wimmo/Services/data.dart';

class Product{

  String id;
  String idadmin;
  String admincontact;
  String intitule_bien;
  String type_bien;
  String type_mandat;
  String superficie;
  String pays;
  String ville;
  String quartier;
  String description;
  String prix;
  String negoce;
  String nbetage;
  String nbpiece;
  String nbchambre;
  String nbsallebain;
  String nbtoilvisiteur;
  String nbsallesejour;
  String image1;
  String image2;
  String image3;
  String image4;
  String date_inscrit;

  Product({this.id,this.idadmin,this.admincontact,this.intitule_bien,this.type_bien,this.type_mandat,this.superficie,this.pays,this.ville,this.quartier,
    this.description,this.prix,this.negoce,this.nbetage,this.nbpiece,this.nbchambre,this.nbsallebain,this.nbtoilvisiteur,this.nbsallesejour, this.image1,this.image2,this.image3,this.image4,this.date_inscrit});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id:json['id'] as String,
      idadmin:json['idadmin'] as String,
      admincontact:json['admincontact'] as String,
      intitule_bien: json['intitule_bien'] as String,
      type_bien: json['type_bien'] as String,
      type_mandat: json['type_mandat'] as String,
      superficie: json['superficie'] as String,
      pays: json['pays'] as String,
      ville:  json['ville'] as String,
      quartier:  json['quartier'] as String,
      description: json['description'] as String,
      prix: json['prix'] as String,
      negoce: json['negoce'] as String,
      nbetage:json['nbetage'] as String,
      nbpiece:json['nbpiece'] as String,
      nbchambre:json['nbchambre'] as String,
      nbsallebain:json['nbsallebain'] as String,
      nbtoilvisiteur:json['nbtoilvisiteur'] as String,
      nbsallesejour:json['nbsallesejour'] as String,
      image1:json['image1'] as String,
      image2:json['image2'] as String,
      image3:json['image3'] as String,
      image4:json['image4'] as String,
      date_inscrit:json['date_inscrit'] as String,
    );
  }
}
List <Product> produts= List();
