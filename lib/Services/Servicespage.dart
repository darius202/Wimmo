import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wimmobeta/Services/data.dart';
import 'package:wimmobeta/product.dart';


class GetProduct{
  static const ROOT ='https://afriqueimmobilier.net/immo/connectionClient.php';
  static Future<List<Product>> getProduct(String mandat,String type,String pays,String ville) async {
    try{
      var map= Map<String, dynamic>();
      map['action']= 'Get_PODUCT';
      map['mandat']=mandat;
      map['type']=type;
      map['pays']=pays;
      map['ville']=ville;
      final response = await http.post(ROOT,body:map);
      print('Voici le message du body getProduit : ${response.body}');
      if(200 == response.statusCode){
        List<Product> list = parseResponse(response.body);
        return list;
      }else{
        return List<Product>();
      }
    }
    catch(e){

      return List<Product>();
    }
  }
  static List<Product> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

}

class Paysservices{
  static const ROOT ='https://afriqueimmobilier.net/immo/localisation.php';
  static const _GET_ALL_ACTION="GET_PAYS";

  static Future<List<Pays>> getPays() async {
    try{
      var map= Map<String, dynamic>();
      map['action']= _GET_ALL_ACTION;
      final response = await http.post(ROOT,body:map);
      print('Voici le message du body getPays : ${response.body}');
      if(200 == response.statusCode){
        List<Pays> list = parseResponse(response.body);
        return list;
      }else{
        return List<Pays>();
      }
    }
    catch(e){

      return List<Pays>();
    }
  }
  static List<Pays> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Pays>((json) => Pays.fromJson(json)).toList();
  }

}

class Villeservices{
  static const ROOT ='https://afriqueimmobilier.net/immo/localisation.php';
  static const _GET_VILE_ACTION= 'GET_VILLE';

  static Future<List<Ville>> getVille() async {
    try{
      var map= Map<String, dynamic>();
      map['action']= _GET_VILE_ACTION;
      final response = await http.post(ROOT,body:map);
      print('Voici le message du body getVille: ${response.body}');
      if(200 == response.statusCode){
        List<Ville> list = parseResponse(response.body);
        return list;
      }else{
        return List<Ville>();
      }
    }
    catch(e){

      return List<Ville>();
    }
  }
  static List<Ville> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Ville>((json) => Ville.fromJson(json)).toList();
  }

}

class Quartierservices{
  static const ROOT ='https://afriqueimmobilier.net/immo/localisation.php';
  static const _GET_QUARTIER_ACTION= 'GET_QUARTIER';

  static Future<List<Quartier>> getQuartier() async {
    try{
      var map= Map<String, dynamic>();
      map['action']= _GET_QUARTIER_ACTION;

      final response = await http.post(ROOT,body:map);
      print('Voici le message du body getQuartier: ${response.body}');
      if(200 == response.statusCode){
        List<Quartier> list = parseResponse(response.body);
        return list;
      }else{
        return List<Quartier>();
      }
    }
    catch(e){

      return List<Quartier>();
    }
  }
  static List<Quartier> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Quartier>((json) => Quartier.fromJson(json)).toList();
  }

}

class TypeBienservices{
  static const ROOT ='https://afriqueimmobilier.net/immo/localisation.php';
  static const _GET_QUARTIER_ACTION= 'GET_MANDAT';

  static Future<List<Mandat>> getMandat() async {
    try{
      var map= Map<String, dynamic>();
      map['action']= _GET_QUARTIER_ACTION;

      final response = await http.post(ROOT,body:map);
      print('Voici le message du body getQuartier: ${response.body}');
      if(200 == response.statusCode){
        List<Mandat> list = parseResponse(response.body);
        return list;
      }else{
        return List<Mandat>();
      }
    }
    catch(e){

      return List<Mandat>();
    }
  }
  static List<Mandat> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Mandat>((json) => Mandat.fromJson(json)).toList();
  }

}


class Situationservices{
  static const ROOT ='https://afriqueimmobilier.net/immo/localisation.php';
  static const _GET_QUARTIER_ACTION= 'GET_SITUATION';

  static Future<List<Situationadmin>> getSituationadmin() async {
    try{
      var map= Map<String, dynamic>();
      map['action']= _GET_QUARTIER_ACTION;

      final response = await http.post(ROOT,body:map);
      print('Voici le message du body getSituationadmin: ${response.body}');
      if(200 == response.statusCode){
        List<Situationadmin> list = parseResponse(response.body);
        return list;
      }else{
        return List<Situationadmin>();
      }
    }
    catch(e){

      return List<Situationadmin>();
    }
  }
  static List<Situationadmin> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Situationadmin>((json) => Situationadmin.fromJson(json)).toList();
  }

}
class Bienservices{
  static const ROOT ='https://afriqueimmobilier.net/immo/localisation.php';
  static const _GET_QUARTIER_ACTION= 'GET_LOUER';

  static Future<List<Bienlouable>> getLouer() async {
    try{
      var map= Map<String, dynamic>();
      map['action']= _GET_QUARTIER_ACTION;

      final response = await http.post(ROOT,body:map);
      print('Voici le message du body getQuartier: ${response.body}');
      if(200 == response.statusCode){
        List<Bienlouable> list = parseResponse(response.body);
        return list;
      }else{
        return List<Bienlouable>();
      }
    }
    catch(e){

      return List<Bienlouable>();
    }
  }
  static List<Bienlouable> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Bienlouable>((json) => Bienlouable.fromJson(json)).toList();
  }

}


class Etageservices{
  static const ROOT ='https://afriqueimmobilier.net/immo/localisation.php';
  static const _GET_QUARTIER_ACTION= 'GET_ETAGE';

  static Future<List<Etage>> getEtage() async {
    try{
      var map= Map<String, dynamic>();
      map['action']= _GET_QUARTIER_ACTION;

      final response = await http.post(ROOT,body:map);
      print('Voici le message du body getQuartier: ${response.body}');
      if(200 == response.statusCode){
        List<Etage> list = parseResponse(response.body);
        return list;
      }else{
        return List<Etage>();
      }
    }
    catch(e){

      return List<Etage>();
    }
  }
  static List<Etage> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Etage>((json) => Etage.fromJson(json)).toList();
  }

}

class SignalServices{
  static Future<String> addSignal(String idbien,String message,String contact) async{
    try{
      var map= Map<String, dynamic>();
      map['idbien']= idbien;
      map['message']= message;
      map['contact']= contact;
      final response = await http.post('https://afriqueimmobilier.net/immo/signalbien.php',body:map);
      print('Voici le message du body addProduit: ${response.body}');
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    }
    catch(e){
      return "error";
    }

  }
}

class SuggestionServices{
  static Future<String> addSuggestion(String message,String contact) async{
    try{
      var map= Map<String, dynamic>();
      map['message']= message;
      map['contact']= contact;
      final response = await http.post('https://afriqueimmobilier.net/immo/suggestion.php',body:map);
      print('Voici le message du body addProduit: ${response.body}');
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    }
    catch(e){
      return "error";
    }

  }
}