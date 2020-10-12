import 'package:flutter/material.dart';
import 'package:wimmobeta/conditions.dart';
import 'package:wimmobeta/createDrawerBodyItem.dart';
import 'package:wimmobeta/createDrawerHeader.dart';
import 'package:wimmobeta/transition.dart';

class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.share,
            text: "Partager l'application",
            onTap: () {

            }
          ),
          createDrawerBodyItem(
          icon: Icons.info_outline,
            text: "Conditions d'utilisation",
            onTap: () {
              Navigator.push(context, SlideRightRoute(page:Condition()));
            }
          ),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}