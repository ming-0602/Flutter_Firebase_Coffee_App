import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'stfulproductcard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'service/database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final dbMethod = DatabaseMethod();
  final allData = await dbMethod.getAllProducts();
  print(allData);
  runApp(MyApp(allData: allData));
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> allData;
  const MyApp({Key? key, required this.allData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(child: ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: false,
      child: MaterialApp( home: Scaffold(
        appBar: AppBar(
          title: const Text('=3=', style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Colors.yellow,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: allData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 145/175
            ),
            itemBuilder: (BuildContext context, int index){
              final item = allData[index];
              return productstatefulpage(name: item['data']['product_name'], image: item['data']['product_img']);
            },
          ),
        ),
        bottomNavigationBar: const CusBotAppBar(),
        floatingActionButton: cartbutton(),
      ),
      ),
    )
    );
  }
}

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