import 'package:diamond_app/Home/exclusive_screen.dart';
import 'package:diamond_app/Home/hold_list_screen.dart';
import 'package:diamond_app/Home/my_offer_screen.dart';
import 'package:diamond_app/Home/new_arrival_screen.dart';
import 'package:diamond_app/Home/search_bottom_navigation_screen.dart';
import 'package:diamond_app/Home/upcomming_screen.dart';
import 'package:diamond_app/widget/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  List<String> image = [
    "assets/images/search.png",
    "assets/images/new_arrival.png",
    "assets/images/Exclusive.png",
    "assets/images/upcoming.png",
    "assets/images/hold_list.png",
    "assets/images/offer.png",
  ];
  List<String> name = [
    "Search",
    "New Arrival",
    "Exclusive",
    "Upcoming",
    "Hold List",
    "My Offers",
  ];

  List<Widget> screen = [
    const SearchBottomNavigationScreen(),
    NewArrivalScreen(),
    ExclusiveScreen(),
    UpcomingScreen(),
    HoldListScreen(),
    // MyOffersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey)),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => screen[index],
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    image[index],
                    height: 35,
                  ),
                  SizedBox(height: 1.h),
                  Text(name[index]),
                ],
              ),
            );
          },
        ));
  }
}
