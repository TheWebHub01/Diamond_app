import 'package:diamond_app/Model/cart_model.dart';
import 'package:diamond_app/service/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottamnavBar extends StatefulWidget {
  String? id;
  String? comments;
  String? certiNo;
  String? certificateUrl;
  String? certified;
  String? city;
  String? clarity;
  String? color;
  String? cut;
  String? depth;
  String? fluorescene;
  String? imageUrl;
  String? mesurement;
  String? polish;
  String? shape;
  String? size;
  String? sizeRange;
  String? status;
  String? stoneID;
  String? symm;
  String? table;
  String? type;
  String? videoUrl;

  List? screens = [];

  BottamnavBar({
    super.key,
    this.screens,
    this.id,
    this.comments,
    this.certiNo,
    this.certificateUrl,
    this.certified,
    this.city,
    this.clarity,
    this.color,
    this.cut,
    this.depth,
    this.fluorescene,
    this.polish,
    this.shape,
    this.size,
    this.sizeRange,
    this.status,
    this.stoneID,
    this.symm,
    this.table,
    this.type,
    this.videoUrl,
  });

  @override
  State<BottamnavBar> createState() => _BottamnavBarState();
}

class _BottamnavBarState extends State<BottamnavBar> {
  int _selectedIndex = 0;
  String userid = '';

  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 3) {
      final cartService = CartService();
      final cartItem = CartItem(
        id: widget.id!,
        comments: widget.comments!,
        certiNo: widget.certiNo!,
        certificateUrl: widget.certificateUrl!,
        certified: widget.certified!,
        city: widget.city!,
        clarity: widget.clarity!,
        color: widget.color!,
        cut: widget.cut!,
        depth: widget.depth!,
        fluorescene: widget.fluorescene!,
        imageUrl: widget.imageUrl!,
        mesurement: widget.mesurement!,
        polish: widget.polish!,
        shape: widget.shape!,
        size: widget.size!,
        sizeRange: widget.sizeRange!,
        status: widget.status!,
        stoneID: widget.stoneID!,
        symm: widget.symm!,
        table: widget.table!,
        type: widget.type!,
        videoUrl: widget.videoUrl!,
      );
      await cartService.addToCart(userid, cartItem);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.shape} added to cart!')),
      );
    }
  }

  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.getString('userid');
    print("prefs.getString('userid'):=>${prefs.getString('userid')}");
    setState(() {
      userid = prefs.getString('userid')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              backgroundColor: const Color(0xffFAFAFA),
              selectedItemColor: Colors.brown,
              unselectedItemColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
              showUnselectedLabels: true,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.percent), label: "make Offer"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined), label: "Buy Now"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.front_hand_outlined), label: "Hold Now"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_shopping_cart_outlined),
                    label: "Add Cart"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), label: "Add Memo"),
              ],
            ),
            body: widget.screens![_selectedIndex]),
      ),
    );
  }
}
