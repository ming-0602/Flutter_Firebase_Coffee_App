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
    _futureAllData = _databaseMethod.getAllProducts();
    await _futureAllData;
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(child: ScreenUtilInit(

      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: false,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              '=3=', style: TextStyle(fontWeight: FontWeight.bold),),
            backgroundColor: Colors.yellow,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    addedtocart_item(),
                    addedtocart_item(),
                    addedtocart_item(),
                    addedtocart_item(),
                    addedtocart_item(),
                    addedtocart_item(),
                    addedtocart_item(),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(11.0),
              //   child: Container(
              //     color: Colors.black,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         ElevatedButton(
              //           onPressed: () {
              //             // Add your button action here
              //           },
              //           child: Text('Your Button'),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              checkoutbutton()
            ],
          ),
          // addedtocart_item(),
          bottomNavigationBar: CusBotAppBar(),
          // floatingActionButton: cartbutton(),
        ),
      ),
    )
    );
  }
}
