import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:coffee/page/cartpage.dart';

class cartbutton extends StatefulWidget {
  const cartbutton({super.key});

  @override
  State<cartbutton> createState() => _cartbuttonState();
}

class _cartbuttonState extends State<cartbutton> {

  void _openCartpage() {
    // Navigator.of(context).pop();
    print(ModalRoute.of(context)?.settings.name ?? "");
    // Navigator.pushNamed(context, 'cartpage');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => CartPage())
    // );
  }

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: Text("0"),
      position: badges.BadgePosition.topEnd(top: -10, end: -5),
      child: FloatingActionButton(
        onPressed: () {
          _openCartpage();
        },
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.shopping_cart,color: Colors.black87,),
      ),
    );
  }
}
