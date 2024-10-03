import 'package:flutter/material.dart';

class BottamnavBar extends StatefulWidget {
   List screens = [];

   BottamnavBar({super.key,required this.screens});

  @override
  State<BottamnavBar> createState() => _BottamnavBarState();
}

class _BottamnavBarState extends State<BottamnavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    const snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 300),
      content: Text('Please select Stone'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
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
            body: widget.screens[_selectedIndex]),
      ),
    );
  }
}
