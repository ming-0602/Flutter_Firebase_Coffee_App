import 'package:flutter/material.dart';
import 'package:coffee/service/database.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee/widget/stfulproductcard.dart';
import 'package:coffee/widget/cartbutton.dart';
import 'package:coffee/widget/bottomnavbar.dart';
import 'cartpage.dart';

class Mainpage extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> allData;
  // MyApp({Key? key}) : super(key: key);

  final dbMethod = DatabaseMethod();
  Mainpage({Key? key}) : allData = DatabaseMethod().getAllProducts(), super(key: key);

  static int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: allData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // or any loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Map<String, dynamic>> data = snapshot.data!;
          return SafeArea(
            child: ScreenUtilInit(
              designSize: const Size(360, 640),
              minTextAdapt: true,
              splitScreenMode: false,
              child: MaterialApp(
                home: Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      '=3=',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.yellow,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: data.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 145 / 175,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final item = data[index];
                        return productstatefulpage(
                          id: item['id'],
                          name: item['data']['product_name'],
                          image: item['data']['product_img'],
                        );
                      },
                    ),
                  ),
                  bottomNavigationBar: CusBotAppBar(),
                  // floatingActionButton: cartbutton(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}