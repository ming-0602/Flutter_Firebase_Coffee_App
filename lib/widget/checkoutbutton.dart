import 'package:flutter/material.dart';
import 'package:coffee/service/database.dart';

class checkoutbutton extends StatefulWidget {
  const checkoutbutton({super.key});

  @override
  State<checkoutbutton> createState() => _checkoutbuttonState();
}

class _checkoutbuttonState extends State<checkoutbutton> {
  final dbMethod = DatabaseMethod();

  void _showalertconfirmationdiaglo(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Checkout'),
        content: Text("You have chcekout out"),
        actions: <Widget>[
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('OK!'))
        ]
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: Container(
        // color: Colors.transparent,
        decoration: BoxDecoration(color: Colors.white.withOpacity(1)),
        child: Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
              onPressed: (){
                dbMethod.placeOrder();
                _showalertconfirmationdiaglo();
              },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow)
            ),
            child: Text('Checkout' , style: TextStyle(fontSize: 12, color: Colors.black),),
          ),
        ),
      ),
    );
  }
}
