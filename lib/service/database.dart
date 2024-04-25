// import 'dart:js_interop';

// import 'dart:html';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAllProducts() async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection('product').get();
      return snapshot.docs.map((doc) {
        final documentId = doc.id;
        final data = doc.data();
        return {'id': documentId, 'data': data};
      }).toList();
    } catch (e) {
      // Handle error
      print('Error fetching products: $e');
      return []; // Return empty list on error
    }
  }

  Future<Map<String, dynamic>?> getProductById(String id) async {
    try {
      final DocumentSnapshot snapshot = await _firestore.collection('product').doc(id).get();
      if (snapshot.exists) {
        final data = snapshot.data();
        return {'id': snapshot.id, 'data': data,};
      } else {
        print('Document with ID $id does not exist.');
        return null;
      }
    } catch (e) {
      // Handle error
      print('Error fetching product: $e');
      return null; // Return null on error
    }
  }


  Future<void> addProducttoCart(Map<String, dynamic> productData) async {
   try {
     CollectionReference item = FirebaseFirestore.instance.collection('cart');
     item.add(
       productData
     );
   }catch (e) {
     print('Error writing product: $e');
    }
  }


  Future<List<Map<String, dynamic>>> getAddedtoCartItem() async{
    try{
      final QuerySnapshot snapshot = await _firestore.collection('cart').get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return {"data" :data};
      }).toList();
    }catch(e){
      print('Error : $e');
      return [];
    }
  }

  Future<void> removeCartItem(String product_name) async{
    QuerySnapshot snapshot = await _firestore.collection('cart').where('product_name', isEqualTo: product_name).get();
    snapshot.docs.forEach((doc) async{
      await doc.reference.delete();
    });
  }

  Stream<List<Map<String, dynamic>>> getAddedtoCartItemStream() {
    StreamController<List<Map<String, dynamic>>> controller = StreamController<List<Map<String, dynamic>>>();
    _firestore.collection('cart').snapshots().listen((QuerySnapshot snapshot) {
      List<Map<String, dynamic>> cartItems = [];
      for (var doc in snapshot.docs) {
        final data = doc.data();
        cartItems.add({"data": data});
      }
      controller.add(cartItems);
    }, onError: (error) {
      print('Stream Error: $error');
      controller.addError(error);
    });
    return controller.stream;
  }
}