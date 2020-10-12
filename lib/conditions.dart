import 'package:flutter/material.dart';
import 'package:wimmobeta/appbar.dart';
import 'package:wimmobeta/constants.dart';

class Condition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Text("CONDITIONS D'UTILISATION DE WIMMO",
                    style:TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: kTextLigthtColor)),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text("L'application WIMMO est une plateforme de rencontre entre demandeurs et offreurs des services immobiliers."
                    "Nous travaillons à permettre aux personnes qui souhaitent louer ou acheter un immeuble, de rencontrer"
                    "les personnes physiques ou morales ayant des biens qui pourraient correspondre à leurs attentes. ",
                    style:TextStyle(fontSize:14,color: kTextLigthtColor)),
              ),
              SizedBox(height: 20.0,),
              Center(
                child: Text("Toutefois, WIMMO en tant qu'une application mobile, n'est pas une agence immobilière, encore moins une plateforme"
                    " de propositions des biens et services immobiliers.",
                    style:TextStyle(fontSize:14,color: kTextLigthtColor)),
              ),
              SizedBox(height: 5.0,),
              Center(
                child: Text("Nous ne faisons que faciliter la rencontre entre les potentiels offreurs et demandeurs des biens immobiliers.",
                    style:TextStyle(fontSize:14,color: kTextLigthtColor)),
              ),
              SizedBox(height: 5.0,),
              Center(
                child: Text("Ainsi donc chaque utilisateur de notre plateforme est entièrement responsable de ses choix de partenariat avec les personnes physiques ou morales qu'il rencontre par notre biais.",
                    style:TextStyle(fontSize:14,color: kTextLigthtColor)),
              ),
              SizedBox(height: 5.0,),
              Center(
                child: Text("Toutefois en tant qu'utilisateur de l'application WIMMO vous êtes vivement encouragé à signaler au moyen de l'onglet prévu à cet effet sur la plateforme, tout annonceur,  biens et services immobiliers qui n'auraient pas satisfait vos attentes, en précisant les détails de votre insatisfaction.",
                    style:TextStyle(fontSize:14,color: kTextLigthtColor)),
              ),
              SizedBox(height: 5.0,),
              Center(
                child: Text("Les signalements nous permettront de mieux contrôler les annonceurs en vue de faciliter votre accès à des biens et services de meilleurs qualité.",
                    style:TextStyle(fontSize:14,color: kTextLigthtColor)),
              ),
              SizedBox(height: 5.0,),
              Center(
                child: Text("Lu et approuvé",
                    style:TextStyle(fontSize:14,color: kTextLigthtColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
