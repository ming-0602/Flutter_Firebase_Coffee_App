import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee/service/database.dart';
import 'package:coffee/widget/radiolist.dart';
import 'package:coffee/widget/productpage_addtocart_button.dart';

class productpage extends StatefulWidget {
  final String name;
  final String image;
  final String id;

  const productpage({
    Key? key,
    required this.name,
    required this.image,
    required this.id
  }) : super(key: key);

  @override
  State<productpage> createState() => _productpageState();
}

class _productpageState extends State<productpage> {

  final dbmethod = DatabaseMethod();
  late Future<Map<String, dynamic>?> productFuture;

  @override
  void initState() {
    super.initState();
    print('this is the id');
    print(widget.id);
    productFuture = dbmethod.getProductById(widget.id);
    productFuture.then((data) {
      if (data != null) {
        print(data); // Print the data retrieved from Firebase
      }
    }).catchError((error) {
      print("Error fetching product data: $error");
    });
  }

  List<String> options = ['Small','Medium', 'Large'];
  String currentOption = "";

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>?>(
        future: productFuture,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(
              child: Text('Error: Unable to load product data'),
            );
          }
          final criteria = snapshot.data!['data']['criteria'];

          return Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 360.w,
                        height: 202.h,
                        child: Image.network(snapshot.data!['data']['product_img'], fit: BoxFit.cover,),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Container(
                        width: 360.w,
                        height: 16.h,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(snapshot.data!['data']['product_name'], style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                          // child: Text(snapshot.data!['data']['criteria'][0]['Size'][0].toString(), style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),), //this can get Small
                        ),
                      ),
                      radiolist(criteria :criteria),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 1),
                      child: pg_addtocart(name: snapshot.data!['data']['product_name'], image: snapshot.data!['data']['product_img']),
                    )
                ),
              ],
            ),
          );
        },
      )

    );
  }
}