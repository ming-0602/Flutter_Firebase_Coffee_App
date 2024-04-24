import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/bottomnavbar.dart';
import '../widget/cartbutton.dart';
import 'package:coffee/service/database.dart';
import 'package:coffee/main.dart';
import 'package:coffee/widget/addedtocartitem.dart';
import 'package:coffee/widget/checkoutbutton.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final DatabaseMethod _databaseMethod = DatabaseMethod();
  late Future<List<Map<String, dynamic>>> _futureAllData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _futureAllData = _databaseMethod.getAddedtoCartItem();
    await _futureAllData;
    // print('this is the cartpage');
    // print(_futureAllData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('=3=', style: TextStyle(fontWeight: FontWeight.bold),),
            backgroundColor: Colors.yellow,
          ),
          body: FutureBuilder<List<Map<String, dynamic>>>(
            future: _futureAllData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Data is available, build ListView
                final List<Map<String, dynamic>> data = snapshot.data!;
                // print(data[0]['data']['product_name']);
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final itemData = data[index]['data'];
                          final productName = itemData?['product_name'] ?? '';
                          final productImage = itemData?['product_img'] ?? '';
                          final quantity = itemData?['quantity'] ?? '';
                          return addedtocart_item(name: productName, img: productImage, quantity: quantity.toString(),);
                        },
                      ),
                    ),
                    checkoutbutton(),
                  ],
                );
              }
            },
          ),
          bottomNavigationBar: CusBotAppBar(),
        ),
      ),
    );
  }
}
