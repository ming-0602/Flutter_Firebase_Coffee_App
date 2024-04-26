// import 'dart:js_interop';

// import 'dart:html';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

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
      final QuerySnapshot snapshot = await _firestore.collection('cart').where('product_name', isEqualTo: productData['product_name']).get();
      CollectionReference item = FirebaseFirestore.instance.collection('cart');
      if (snapshot.docs.isNotEmpty) {
        for (final doc in snapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;
          if(data?['product_name'] == productData['product_name']){
            await doc.reference.update({'quantity' : data?['quantity'] + 1});
            return;
          }
        }
      } else {
        item.add(
            productData
        );
      }

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

  Future<void> decreaseProductQuantity(String product_name) async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection('cart').where('product_name', isEqualTo: product_name).get();

      for (final doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        if (data['quantity'] > 1) {
          await doc.reference.update({'quantity': data['quantity'] - 1});
        } else {
          // If quantity is 1, remove the product from the cart
          await doc.reference.delete();
        }
      }
    } catch (e) {
      print('Error decreasing product quantity: $e');
    }
  }

  Future<void> increaseProductQuantity(String product_name) async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection('cart').where('product_name', isEqualTo: product_name).get();

      for (final doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        await doc.reference.update({'quantity': data['quantity'] + 1});
      }
    } catch (e) {
      print('Error increasing product quantity: $e');
    }
  }
}