import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee/widget/bottomnavbar.dart';

class activitypage extends StatefulWidget {
  const activitypage({super.key});

  @override
  State<activitypage> createState() => _activitypageState();
}

class _activitypageState extends State<activitypage> {
  int? _expandedOrder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: false,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('=3=', style: TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: Colors.yellow,
            ),
            body: ListView(
              children: [
                for (int i = 0; i < 10; i++)
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_expandedOrder == i) {
                              _expandedOrder = null; // Collapse if already expanded
                            } else {
                              _expandedOrder = i; // Expand
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 340.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Order ${i + 1}', style: TextStyle(fontSize: 20.sp)),
                                ),
                                if (_expandedOrder == i) ...[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Item 1', style: TextStyle(fontSize: 16.sp),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Item 2' ,style: TextStyle(fontSize: 16.sp),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Item 3' ,style: TextStyle(fontSize: 16.sp),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Item 4' ,style: TextStyle(fontSize: 16.sp),),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            bottomNavigationBar: CusBotAppBar(),
          ),
        ),
      ),
    );
  }
}