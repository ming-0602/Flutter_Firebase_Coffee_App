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
        return {'id': snapshot.id, 'data': data};
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

  
}