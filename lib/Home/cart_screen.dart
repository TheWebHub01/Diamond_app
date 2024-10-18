import 'package:diamond_app/Home/diamond_details_screen.dart';
import 'package:diamond_app/Home/home_screen.dart';
import 'package:diamond_app/Model/cart_model.dart';
import 'package:diamond_app/email/email.dart';
import 'package:diamond_app/service/cart_service.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String userId = '';

  // Fetch the user ID from SharedPreferences
  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUserId =
        prefs.getString('userid'); // Safely handle the nullable return

    if (savedUserId != null) {
      // Set the userId only if it's not null
      setState(() {
        userId = savedUserId;
      });
      print("User ID from SharedPreferences: $userId");
    } else {
      // Handle the case where userid is null
      print("User ID is null in SharedPreferences");
      // Optionally, show an error message or redirect to login if userId is required
    }
  }

  @override
  void initState() {
    super.initState();
    getUser(); // Fetch the user ID when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            showActionButton: false,
            title: "Cart Screen",
            backOnTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          Container(
            height: 11.h,
            width: double.infinity,
            color: const Color(0xffA47842).withOpacity(0.2),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pcs",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("50"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("CTS", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("185.14"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dis%", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("99.47"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Price/CT",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("199"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Value",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("36906"),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: userId.isEmpty
                ? Center(
                    child: Text(
                        'Please log in to view your cart.')) // Handle empty user ID case
                : FutureBuilder<List<CartItem>>(
                    future: CartService().getCartItems(userId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        print('Error: ${snapshot.error}');
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      final cartItems = snapshot.data ?? [];
                      if (cartItems.isEmpty) {
                        return Center(child: Text('Your cart is empty.'));
                      }
                      return ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          print("item.imageUrl:=>${item.city}");
                          Map<String, double> result =
                              extractMeasurement(item.mesurement);
                          Map<String, String> parseMeasurement(
                              String measurement) {
                            List<String> parts = measurement.split('*');

                            String lengthRange = parts[0];
                            String width = parts[1];

                            List<String> lengthParts = lengthRange.split('-');
                            String lengthStart = lengthParts[0];
                            String lengthEnd =
                                lengthParts.length > 1 ? lengthParts[1] : "";

                            print("lengthStart:=>${lengthStart}");

                            return {
                              "lengthStart": lengthStart,
                              "lengthEnd": lengthEnd,
                              "width": width
                            };
                          }

                          String firstCharacter = item.status.substring(0, 1);

                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                DiamondDetailsScreen(
                                  itemData2: item,
                                  pageName: "CartScreen",
                                  next: false,
                                  Comments: item.comments,
                                  certiNo: item.certiNo,
                                  certificate_url: item.certificateUrl,
                                  certified: item.certified,
                                  city: item.city,
                                  clarity: item.clarity,
                                  color: item.color,
                                  cut: item.cut,
                                  depth: item.depth,
                                  fluorescene: item.fluorescene,
                                  id: item.id,
                                  image_url: item.imageUrl,
                                  mesurement: item.mesurement,
                                  polish: item.polish,
                                  shape: item.shape,
                                  size: item.size,
                                  sizeRange: item.sizeRange,
                                  status: item.status,
                                  stone_ID: item.stoneID,
                                  symm: item.symm,
                                  table: item.table,
                                  type: item.type,
                                  video_url: item.videoUrl,
                                ),
                              );
                            },
                            child: Container(
                              color: const Color(0xffA47842).withOpacity(0.2),
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(item.stoneID),
                                      item.imageUrl == ""
                                          ? Image.asset(
                                              "assets/images/no_image.png",
                                              height: 45,
                                              width: 45,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              item.imageUrl,
                                              height: 45,
                                              width: 45,
                                            ),
                                      Text(item.shape),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(item.size),
                                          const SizedBox(width: 5),
                                          Text(item.color),
                                          const SizedBox(width: 5),
                                          Text(item.clarity),
                                        ],
                                      ),
                                      Text("FIN: ${item.cut}  ${item.symm}"),
                                      Text("FLOU: ${item.fluorescene}"),
                                      Row(
                                        children: [
                                          Text("${item.city}"),
                                          const SizedBox(width: 10),
                                          Text("${item.certified}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Length: ${result['lengthStart']}"),
                                      Text("width: ${result['width']}"),
                                      Text("Depth: ${item.depth}"),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text("-99.51%"),
                                      const Text("264.60\$ ICt"),
                                      const Text("\$1.562.89"),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red),
                                        child: Center(
                                          child: Text(
                                            firstCharacter,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Map<String, double> extractMeasurement(String measurement) {
    List<String> parts = measurement.split(RegExp(r'[-*]'));

    Map<String, double> result = {};

    if (parts.length == 3) {
      double lengthStart = double.parse(parts[0]);
      double lengthEnd = double.parse(parts[1]);
      double width = double.parse(parts[2]);

      double length = (lengthStart + lengthEnd) / 2;

      double ratio = length / width;

      result['length'] = length;
      result['width'] = width;
      result['ratio'] = ratio;
    } else {
      print("Invalid measurement format");
    }

    return result;
  }
}
