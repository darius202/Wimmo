import 'package:flutter/material.dart';
import 'package:wimmo/details_image.dart';
import 'package:wimmo/constants.dart';


class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    this.fillcolor,
    this.isSelected=false,
    this.numero="  1",
  }) : super(key: key);

  final Color fillcolor;
  final bool isSelected;
  final String numero;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefautPadding/2.5,
      ),
      padding: EdgeInsets.all(3),
      height: 42,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: isSelected ? Color(0xFF707070) : Colors.transparent
          )
      ),
      child: Container(
        padding: EdgeInsets.all( 10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: fillcolor
        ),
        child: Text(numero),
      ),
    );
  }
}