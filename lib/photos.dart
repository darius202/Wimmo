import 'package:cached_network_image/cached_network_image.dart';
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
  static const String lien ="https://afriqueimmobilier.net/immo/images/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: lien+widget.annonce.image1,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error,color:Colors.red),
            ),
            CachedNetworkImage(
              imageUrl: lien+widget.annonce.image2,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error,color:Colors.red),
            ),

            CachedNetworkImage(
              imageUrl: lien+widget.annonce.image3,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error,color:Colors.red),
            ),
            CachedNetworkImage(
              imageUrl: lien+widget.annonce.image4,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error,color:Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
