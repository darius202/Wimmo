class User{
  String id;
  String pseudo="";
  String email;
  String mot_de_passe;
  String pays;
  String ville;
  String quartier;
  String contact;
  String admini;
  String actif;
  String representantId;

  User({this.id,this.pseudo,this.email,this.mot_de_passe,this.pays,this.ville,this.quartier,this.contact,this.admini,this.actif,this.representantId});
  factory User.fromJson(Map<String, dynamic> json){
    return User(
        id:json['id'] as String,
        pseudo:json['pseudo'] as String,
        email: json['email'] as String,
        mot_de_passe: json['mot_de_passe'] as String,
        pays: json['pays'] as String,
        ville:json['ville'] as String,
        quartier: json['quartier'] as String,
        contact: json['contact'] as String,
        admini: json['admini'] as String,
        actif: json['actif'] as String,
        representantId:json['representantId'] as String
    );
  }
}


class Ville{
  String codeville;
  String codepays;
  String intituleville;
  String representantId;
  Ville({this.codeville,this.codepays,this.intituleville,this.representantId});
  @override
  String toString() {
    return '${codeville} ${intituleville}'.toLowerCase() + ' ${codeville} ${intituleville}'.toUpperCase();
  }
  factory Ville.fromJson(Map<String, dynamic> json){
    return Ville(
      codeville:json['codeville'] as String,
      codepays:json['codepays'] as String,
      intituleville:json['intituleville'] as String,
      representantId: json['representantId'] as String,
    );
  }
}
class Quartier{

  String  codequartier;
  String codeville;
  String codepays;
  String intitulequartier;

  Quartier({this.codequartier,this.codeville,this.codepays,this.intitulequartier});
  @override
  String toString() {
    return '${codequartier} ${intitulequartier}'.toLowerCase() + ' ${codequartier} ${intitulequartier}'.toUpperCase();
  }
  factory Quartier.fromJson(Map<String, dynamic> json){
    return Quartier(
      codequartier:json['codequartier'] as String,
      codeville:json['codeville'] as String,
      codepays:json['codepays'] as String,
      intitulequartier:json['intitulequartier'] as String,
    );
  }
}

class Pays {
  String codepays;
  String intitulepays;

  Pays({this.codepays, this.intitulepays});

  factory Pays.fromJson(Map<String, dynamic> json) {
    return Pays(
      codepays: json['codepays'] as String,
      intitulepays: json['intitulepays'] as String,
    );
  }
}

class Mandat {
  String id;
  String mandat;

  Mandat({this.id, this.mandat});

  factory Mandat.fromJson(Map<String, dynamic> json) {
    return Mandat(
      id: json['id'] as String,
      mandat: json['mandat'] as String,
    );
  }
}

class Bienlouable {
  String id;
  String bien;

  Bienlouable({this.id, this.bien});

  factory Bienlouable.fromJson(Map<String, dynamic> json) {
    return Bienlouable(
      id: json['id'] as String,
      bien: json['bien'] as String,
    );
  }
}
class Situationadmin {
  String id;
  String situation;

  Situationadmin({this.id, this.situation});

  factory Situationadmin.fromJson(Map<String, dynamic> json) {
    return Situationadmin(
      id: json['id'] as String,
      situation: json['situation'] as String,
    );
  }
}
List <Situationadmin> situation= List();
class Etage{
  String id;
  String niveau;
  Etage({this.id,this.niveau});
  factory Etage.fromJson(Map<String, dynamic> json) {
    return Etage(
      id: json['id'] as String,
      niveau: json['niveau'] as String,
    );
  }
}
List <Pays> pays;
List <Ville> ville;
List <Quartier> quartier;
List <Mandat> mandat;
List <Etage> etage;
List <Bienlouable> louable;
List <Quartier> quartierachat = List();
List <Quartier> filtreQuartierachat = List();