import 'package:flutter/material.dart';

class CusBotAppBar extends StatelessWidget {
  const CusBotAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.yellow, // Set background color to black
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black87,),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.content_paste_sharp, color: Colors.black87),
            label: 'Activity'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black87),
            label: 'Profile'
        )
      ],
    );
  }
}

