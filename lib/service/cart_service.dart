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
      print('Full data from Firestore: ${data}');

      if (data != null && data.containsKey('items')) {
        List itemsData = data['items'] ?? [];
        print('Items List: ${itemsData}'); // Check the structure of items

        List<CartItem> items = itemsData.map((item) {
          print('Parsing item: $item'); // Debug individual items
          return CartItem.fromMap(item);
        }).toList();

        return items;
      } else {
        print('No items field found in the document.');
      }
    } else {
      print('No document found for user: $userId');
    }

    return [];
  }
}
