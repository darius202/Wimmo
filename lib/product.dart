import 'package:wimmobeta/Services/Servicespage.dart';
import 'package:wimmobeta/Services/data.dart';

class Product{
  String id;
  String idadmin;
  String admincontact;
  String adminpseudo;
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
  String situationadministrative;
  String nbetage;
  String nbsalon;
  String nbchambre;
  String nbcuisine;
  String nbboutique;
  String nbmagasin;
  String nbhall;
  String nbsalledebain;
  String newconstruire;
  String dependance;
  String garage;
  String piscine;
  String jardin;
  String toilettevisiteur;
  String 	debarras;
  String compteurperso;
  String arrierecours;
  String 	balcon;
  String meuble;
  String ascensseur;
  String image1;
  String image2;
  String image3;
  String image4;
  String date_inscrit;

  Product({this.id,this.idadmin,this.admincontact,this.adminpseudo,this.intitule_bien,this.type_bien,this.type_mandat,this.superficie,this.pays,this.ville,this.quartier,
    this.description,this.prix,this.negoce,this.situationadministrative,this.nbetage,this.nbsalon,this.nbchambre,this.nbcuisine,this.nbboutique,this.nbmagasin,this.nbhall,this.nbsalledebain,this.newconstruire,
    this.dependance,this.garage,this.piscine,this.jardin,this.toilettevisiteur,this.debarras,this.compteurperso,this.arrierecours,this.balcon,this.meuble,this.ascensseur, this.image1,this.image2,this.image3,this.image4,this.date_inscrit});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id:json['id'] as String,
      idadmin:json['idadmin'] as String,
      admincontact:json['admincontact'] as String,
      adminpseudo:json['adminpseudo'] as String,
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
      situationadministrative: json['situationadministrative'] as String,
      nbetage: json['nbetage'] as String,
      nbsalon: json['nbsalon'] as String,
      nbchambre: json['nbchambre'] as String,
      nbcuisine: json['nbcuisine'] as String,
      nbboutique:json['nbboutique'] as String,
      nbmagasin:json['nbmagasin'] as String,
      nbhall:json['nbhall'] as String,
      nbsalledebain: json['nbsalledebain'] as String,
      newconstruire: json['newconstruire'] as String,
      dependance: json['dependance'] as String,
      garage: json['garage'] as String,
      piscine: json['piscine'] as String,
      jardin: json['jardin'] as String,
      toilettevisiteur: json['toilettevisiteur'] as String,
      debarras: json['debarras'] as String,
      compteurperso: json['compteurperso'] as String,
      arrierecours: json['arrierecours'] as String,
      balcon: json['balcon'] as String,
      meuble: json['meuble'] as String,
      ascensseur: json['ascensseur'] as String,
      image1:json['image1'] as String,
      image2:json['image2'] as String,
      image3:json['image3'] as String,
      image4:json['image4'] as String,
      date_inscrit:json['date_inscrit'] as String,
    );
  }

}
List <Product> produts= List();

List <Product> Filtreproducts= List();
