import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffee/main.dart';
import 'package:coffee/service/database.dart';
import 'package:coffee/page/mainpage.dart';
import 'package:coffee/page/cartpage.dart';
import 'package:coffee/page/activitypage.dart';

class CusBotAppBar extends StatefulWidget {
  const CusBotAppBar({super.key});

  @override
  State<CusBotAppBar> createState() => _CusBotAppBarState();
}

class _CusBotAppBarState extends State<CusBotAppBar> {
  final Map<int, Widget> pages = {
    0: Mainpage(),
    1: activitypage(),
    2: CartPage(),
    3: Mainpage(),
    // Add more pages as needed
  };

  static int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.yellow,
      type: BottomNavigationBarType.fixed,// Set background color to black
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
            icon: Icon(Icons.shopping_cart, color: Colors.black87),
            label: 'Cart'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black87),
            label: 'Profile'
        ),
      ],
      currentIndex: _currentPageIndex,
      onTap: (int index) async {
        if (index != _currentPageIndex) {
          setState(() {
            _currentPageIndex = index;
          });
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  pages[index]!)
          );
        }

      },
    );
  }
}





