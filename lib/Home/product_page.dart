// import 'package:diamond_app/Model/cart_model.dart';
// import 'package:diamond_app/service/cart_service.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProductPage extends StatefulWidget {
//   final String productId;
//   final String id;
//   final String productName;
//   final double price;

//   ProductPage({
//     required this.productId,
//     required this.productName,
//     required this.price,
//     required this.id,
//   });

//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   String userid = '';
//   void getUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     // prefs.getString('userid');
//     print("prefs.getString('userid'):=>${prefs.getString('userid')}");
//     setState(() {
//       userid = prefs.getString('userid')!;
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userId =
//         userid; // Replace with the actual user ID from authentication

//     return Scaffold(
//       appBar: AppBar(title: Text(widget.productName)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Price: \$${widget.price.toString()}'),
//             ElevatedButton(
//               onPressed: () async {
//                 final cartService = CartService();
//                 final cartItem = CartItem(
//                   id: widget.id,
//                   comments: '',
//                   certiNo: '',
//                   certificateUrl: '',
//                   certified: '',
//                   city: '',
//                   clarity: '',
//                   color: '',
//                   cut: '',
//                   depth: '',
//                   fluorescene: '',
//                   imageUrl: '',
//                 );
//                 await cartService.addToCart(userId, cartItem);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                       content: Text('${widget.productName} added to cart!')),
//                 );
//               },
//               child: Text('Add to Cart'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
