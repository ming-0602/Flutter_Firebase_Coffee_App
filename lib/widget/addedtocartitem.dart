import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addedtocart_item extends StatefulWidget {
  const addedtocart_item({super.key});

  @override
  State<addedtocart_item> createState() => _addedtocart_itemState();
}

class _addedtocart_itemState extends State<addedtocart_item> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 17, 10, 17),
        child: Container(
          width: 340.w,
          height: 71.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 11, 0, 11),
                child: Container(
                    width: 128.w,
                    height: 52.h,
                    child: FittedBox(
                      child: Image.network('https://images.immediate.co.uk/production/volatile/sites/30/2020/08/flat-white-3402c4f.jpg?quality=90&resize=500,454'),
                      fit: BoxFit.fill,
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(14, 11, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: 178.w,
                        height: 24.h,
                        child: Center(child: Text('Latte', style: TextStyle(fontSize: 20.sp),)),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 3),
                      child: Row(
                        children: [
                          Container(
                            width: 101.w,
                            height: 19.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: null,
                                  icon: Icon(Icons.add, size: 16.sp),
                                ),
                                Text('2', style: TextStyle(fontSize: 12.sp)),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: null,
                                  icon: Icon(Icons.remove, size: 16.sp),
                                ),
                                // TextButton(
                                //   onPressed: null,
                                //   child: Text('Remove', style: TextStyle(fontSize: 10.sp)),
                                // )
                              ],
                            ),
                          ),
                          TextButton(onPressed: null, child: Text('Remove', style: TextStyle(fontSize: 12.sp),))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
