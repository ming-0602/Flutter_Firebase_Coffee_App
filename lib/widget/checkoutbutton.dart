import 'package:flutter/material.dart';

class checkoutbutton extends StatefulWidget {
  const checkoutbutton({super.key});

  @override
  State<checkoutbutton> createState() => _checkoutbuttonState();
}

class _checkoutbuttonState extends State<checkoutbutton> {
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
              onPressed: null,
              child: Text('Checkout')
          ),
        ),
      ),
    );
  }
}
