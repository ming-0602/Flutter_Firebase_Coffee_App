import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee/service/database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class pg_addtocart extends StatefulWidget {

  final String name;
  final String image;

  const pg_addtocart({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  State<pg_addtocart> createState() => _pg_addtocartState();
}

class _pg_addtocartState extends State<pg_addtocart> {
  final dbMethod = DatabaseMethod();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 54.h,
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: 328.w,
            height: 32.h,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => rickRoll()));
                Map<String, dynamic> tem = {
                  "product_name" : widget.name,
                  "product_img" : widget.image,
                  "quantity" : 1,
                };
                dbMethod.addProducttoCart(tem);

                Fluttertoast.showToast(msg: "Added to Cart");
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                backgroundColor: Colors.yellow,
                minimumSize: Size(150, 50),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 15.sp,
                      color: Colors.black87,
                    ),
                    Text(
                      " Add to Cart",
                      style: TextStyle(fontSize: 11.sp, color: Colors.black87,),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
