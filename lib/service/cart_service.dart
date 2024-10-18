import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diamond_app/Home/cart_screen.dart';
import 'package:diamond_app/Home/daimondList_screen.dart';
import 'package:diamond_app/Model/cart_model.dart';
import 'package:flutter/material.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addToCart(
      String userId, CartItem item, BuildContext context, String Shape) async {
    final cartRef = _firestore.collection('carts').doc(userId);
    await cartRef.set({
      'items': FieldValue.arrayUnion([item.toMap()]),
    }, SetOptions(merge: true));

    await ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${Shape} added to cart!')),
    );
    Navigator.pop(context);
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

  Future<void> removeFromCart(
      String userId, CartItem item, BuildContext context, String shape) async {
    final cartRef = _firestore.collection('carts').doc(userId);
    await cartRef.update({
      'items': FieldValue.arrayRemove([item.toMap()]),
    });

    await ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$shape Removed successfully')),
    );
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(),
      ),
    );
  }
}
