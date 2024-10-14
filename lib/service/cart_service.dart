import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diamond_app/Model/cart_model.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addToCart(String userId, CartItem item) async {
    final cartRef = _firestore.collection('carts').doc(userId);
    await cartRef.set({
      'items': FieldValue.arrayUnion([item.toMap()]),
    }, SetOptions(merge: true));
  }

  Future<List<CartItem>> getCartItems(String userId) async {
    final cartRef = _firestore.collection('carts').doc(userId);
    final snapshot = await cartRef.get();
    if (snapshot.exists) {
      final data = snapshot.data();
      List<CartItem> items = (data!['items'] as List)
          .map((item) => CartItem.fromMap(item))
          .toList();
      return items;
    }
    return [];
  }
}
