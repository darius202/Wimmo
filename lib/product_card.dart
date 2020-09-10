import 'package:flutter/material.dart';
import 'package:wimmo/constants.dart';
import 'package:wimmo/product.dart';
class ProductCard extends StatelessWidget{
  const ProductCard({
    this.itemIndex,
    this.product,
    this.press,
    Key key,
  }): super(key:key);

  final int itemIndex;
  final Product product;
  final Function press;

  String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefautPadding,
          vertical: kDefautPadding/6),
      //color: Colors.blueAccent,
      height: 160,
      child: InkWell(
        onTap: press,
        child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 136,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: itemIndex.isEven ? kBlueColor : kPrimaryColor,
                boxShadow: [kDefautlShadow]
            ),
            child:Container(
              margin: EdgeInsets.only(right: 10.0),
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 20,left: size.width/2.2,bottom: 20.0),
              height: size.height/4.5,
              child:  Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefautPadding,
                ),
                height: 160,
                width: 200,
                child:  Image.network("https://gerestock.com/immo/images/"+ product.image1,fit: BoxFit.cover,
                  loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return product.image1 ==""? Text("Aucune image"):Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null ?
                        loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
              )
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: SizedBox(
              height: 136,
              width: size.width-200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,left: 10.0,right: 12.0),
                    child: Text(product.intitule_bien,
                      style: Theme.of(context).textTheme.button,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,left: 10.0,right: 12.0),
                    child: Text("Tél: "+product.admincontact,
                      style: Theme.of(context).textTheme.button,),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefautPadding*1.5,
                        vertical: kDefautPadding/4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                        color: kSecondaryColor
                    ),
                    child: Text(moneyFormat(product.prix.toString())+ " FCFA",
                      style: Theme.of(context).textTheme.button,),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),),

    );
  }
}