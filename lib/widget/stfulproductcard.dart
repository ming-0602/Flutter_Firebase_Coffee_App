import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../page/productpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'package:coffee/service/database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class productcard extends StatefulWidget {

  final String name;
  final String image;
  final String id;

  const productcard({
    Key? key,
    required this.name,
    required this.image,
    required this.id
  }) : super(key: key);

  @override
  State<productcard> createState() => _productcardState();
}

class _productcardState extends State<productcard> {

  void _openIconbutton(){
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      enableDrag: true,
      builder: (ctx) => productpage(name: widget.name, image: widget.image, id: widget.id),
    );
  }

  final dbMethod = DatabaseMethod();

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 5,
        child: GestureDetector(
          onTap: () {
            _openIconbutton();
          },
          child: Container(
            width: 145.w,
            height: 175.h,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8.h,
                  width: 10.w,
                ),
                Container(
                  width: 125.w,
                  height: 95.h,
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                  // color: Colors.blue,
                ),
                SizedBox(height: 8.h),
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 125.w,
                  height: 25.h,
                  // color: Colors.green,
                  child: ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> tem = {
                        "product_name" : widget.name,
                        "product_img" : widget.image,
                        "quantity" : 1,
                      };
                      dbMethod.addProducttoCart(tem);

                      Fluttertoast.showToast(msg: "Added to Cart");
                      // Fluttertoast.cancel();

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: 15.sp,
                            color: Colors.black87,
                          ),
                          Text(
                            " Add to Cart",
                            style: TextStyle(fontSize: 11.sp, color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                  // color: Colors.yellow,
                )
              ],
            ),
          ),
        )
    );
  }
}