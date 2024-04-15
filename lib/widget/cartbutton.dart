import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;


class cartbutton extends StatelessWidget {
  const cartbutton({super.key});
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: Text("0"),
      position: badges.BadgePosition.topEnd(top: -10, end: -5),
      child: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.shopping_cart,color: Colors.black87,),
      ),
    );
  }
}