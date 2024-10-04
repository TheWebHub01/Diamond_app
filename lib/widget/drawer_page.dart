<<<<<<< HEAD
=======
import 'package:diamond_app/progress_loader/progress_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
>>>>>>> 4f1f1556c83e6336d188e9bd3d81a5bbc3fc3c7d
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diamond_app/Home/exclusive_screen.dart';
import 'package:diamond_app/Home/hold_list_screen.dart';
import 'package:diamond_app/Home/my_offer_screen.dart';
import 'package:diamond_app/Home/new_arrival_screen.dart';
import 'package:diamond_app/Home/price_revised_screen.dart';
import 'package:diamond_app/Home/search_bottom_navigation_screen.dart';
import 'package:diamond_app/Home/upcomming_screen.dart';
import 'package:diamond_app/Register/tab_bar_screen.dart';
import 'package:diamond_app/utiles/data_controller.dart';
import 'package:diamond_app/utiles/sherd_pref.dart';
import 'package:diamond_app/widget/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  String? email;

  DrawerPage({super.key, this.email});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  Shr shr = Shr();
  Datacontroller datacontroller = Get.put(Datacontroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shr.readShr;
    datacontroller.readdata();
  }

  @override
  Widget build(BuildContext context) {
    ProgressLoader pl = ProgressLoader(context, isDismissible: true);

    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Archie",
                      style: TextStyle(fontSize: 25),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
                Text(
                  "${widget.email} / Log in",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, 'refresh');
            },
            child: const SizedBox(
              height: 40,
              child: ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text("Home"),
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchBottomNavigationScreen(),
                  ));
            },
            child: const SizedBox(
              height: 40,
              child: ListTile(
                leading: Icon(Icons.search),
                title: Text("Search Criteria"),
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottamnavBar(
                      screens: const [
                        NewArrivalScreen(),
                        NewArrivalScreen(),
                        NewArrivalScreen(),
                        NewArrivalScreen(),
                        NewArrivalScreen(),
                      ],
                    ),
                  ));
            },
            child: const SizedBox(
              height: 40,
              child: ListTile(
                leading: Icon(Icons.new_releases),
                title: Text("New Arrival"),
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottamnavBar(
                      screens: const [
                        ExclusiveScreen(),
                        ExclusiveScreen(),
                        ExclusiveScreen(),
                        ExclusiveScreen(),
                        ExclusiveScreen(),
                      ],
                    ),
                  ));
            },
            child: const SizedBox(
              height: 40,
              child: ListTile(
                leading: Icon(Icons.diamond_outlined),
                title: Text("Exclusive Stone"),
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottamnavBar(
                      screens: const [
                        UpcomingScreen(),
                        UpcomingScreen(),
                        UpcomingScreen(),
                        UpcomingScreen(),
                        UpcomingScreen(),
                      ],
                    ),
                  ));
            },
            child: const SizedBox(
              height: 40,
              child: ListTile(
                leading: Icon(Icons.event_outlined),
                title: Text("Upcoming"),
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PriceRevisedScreen(),
                  ));
            },
            child: const SizedBox(
              height: 40,
              child: ListTile(
                leading: Icon(Icons.paid),
                title: Text("Price Prevised"),
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottamnavBar(
                      screens: const [
                        HoldListScreen(),
                        HoldListScreen(),
                        HoldListScreen(),
                        HoldListScreen(),
                        HoldListScreen(),
                      ],
                    ),
                  ));
            },
            child: const SizedBox(
              height: 40,
              child: ListTile(
                leading: Icon(Icons.front_hand_outlined),
                title: Text("Hold Stone"),
              ),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 40,
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text("My Memo"),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottamnavBar(
                      screens: const [
                        MyOffersScreen(),
                        MyOffersScreen(),
                        MyOffersScreen(),
                        MyOffersScreen(),
                        MyOffersScreen(),
                      ],
                    ),
                  ));
            },
            child: SizedBox(
              height: 40,
              child: ListTile(
                leading: Image.asset(
                  "assets/images/offer1.png",
                  height: 15,
                  width: 15,
                ),
                title: const Text("My Offer List"),
              ),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Logout",
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Are you sure you want to logout account?",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffE1E1E1)),
                                  child: const Center(
                                    child: Text("No"),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await pl.show();
                                  await _logout(context);
                                  await pl.hide();
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffA47842),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffA47842)),
                    // color: const Color(0xffA47842),
                    borderRadius: BorderRadius.circular(13)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login_outlined,
                      color: Color(0xffA47842),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Logout",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffA47842))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    // Clear user details from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navigate to Sign-In screen and remove HomeScreen from the stack
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const TabBarScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
