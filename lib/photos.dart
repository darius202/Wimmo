import 'package:flutter/material.dart';
import 'package:wimmobeta/product.dart';
class Photo extends StatefulWidget {
  Product annonce;
  Photo(Product annonce){
    this.annonce=annonce;
  }
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
               Image.network("https://gerestock.com/immo/images/"+widget.annonce.image1),

          Image.network("https://gerestock.com/immo/images/"+widget.annonce.image2),

            Image.network("https://gerestock.com/immo/images/"+widget.annonce.image3),

             Image.network("https://gerestock.com/immo/images/"+widget.annonce.image4),

          ],
        ),
      ),
    );
  }
}
