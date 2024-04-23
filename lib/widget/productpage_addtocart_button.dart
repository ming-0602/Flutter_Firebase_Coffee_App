import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class pg_addtocart extends StatefulWidget {
  const pg_addtocart({super.key});

  @override
  State<pg_addtocart> createState() => _pg_addtocartState();
}

class _pg_addtocartState extends State<pg_addtocart> {
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
