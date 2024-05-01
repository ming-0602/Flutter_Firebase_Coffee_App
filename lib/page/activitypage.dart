import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee/widget/bottomnavbar.dart';
import 'package:coffee/service/database.dart';

class activitypage extends StatefulWidget {
  const activitypage({super.key});

  @override
  State<activitypage> createState() => _activitypageState();
}

class _activitypageState extends State<activitypage> {
  final dbmethod = DatabaseMethod();
  int? _expandedOrder;
  late Future<List<Map<String, dynamic>>> _activityData;

  @override
  void initState() {
    super.initState();
    _activityData = dbmethod.getActivityData();
  }

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
            body: FutureBuilder<List<Map<String, dynamic>>>(
              future: _activityData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final activityData = snapshot.data!;
                  return ListView.builder(
                    itemCount: activityData.length,
                    itemBuilder: (context, index) {
                      final orderDate = activityData[index]['orderdate'] as String;
                      final items = activityData[index]['items'] as List<Map<String, dynamic>>;
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_expandedOrder == index) {
                                  _expandedOrder = null; // Collapse if already expanded
                                } else {
                                  _expandedOrder = index; // Expand
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
                                      child: Text('Order $orderDate', style: TextStyle(fontSize: 20.sp)),
                                    ),
                                    if (_expandedOrder == index) ...[
                                      for (final item in items)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${item['name']} x ${item['quantity']}',
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                        ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
            bottomNavigationBar: CusBotAppBar(),
          ),
        ),
      ),
    );
  }
}