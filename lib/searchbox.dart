import 'package:flutter/material.dart';
import 'package:wimmobeta/constants.dart';

class SearchBox extends StatelessWidget{

  const SearchBox({
    Key key,
    this.onChanged,
  }): super(key:key);
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width/1.2,
      height: MediaQuery.of(context).size.width/8,
      margin: EdgeInsets.all(kDefautPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefautPadding,
          vertical: kDefautPadding/1.5),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.search,color: Colors.white,),
          Text("      Rechercher un bien",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

}