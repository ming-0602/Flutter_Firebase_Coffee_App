import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class productpage extends StatefulWidget {
  final String name;
  final String image;

  const productpage({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  State<productpage> createState() => _productpageState();
}

class _productpageState extends State<productpage> {
  List<String> options = ['瘦', '中等肥','肥'];
  String currentOption = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 360.w,
                    height: 202.h,
                    child: Image.network(widget.image, fit: BoxFit.cover,),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Container(
                    width: 360.w,
                    height: 16.h,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(widget.name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Radio buttons for options
                  Container(
                    width: 360.w,
                    height: 1.h,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: 360.w,
                    height: 19.h,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text("肉肥度", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Column(
                    children: options.map((option) {
                      return RadioListTile(
                        title: Text(option.toString()),
                        value: option, // Set unique value for each option
                        groupValue: currentOption,
                        onChanged: (value) {
                          setState(() {
                            currentOption = value.toString(); // Update currentOption
                          });
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    width: 360.w,
                    height: 1.h,
                    color: Colors.grey,
                  ),
                  // ListItems go here
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
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
            ),
          ],
        ),
      ),
    );
  }
}