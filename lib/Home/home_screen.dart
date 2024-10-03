import 'package:diamond_app/account/updatedata.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:diamond_app/widget/drawer_page.dart';
import 'package:diamond_app/widget/home_container.dart';
import 'package:diamond_app/widget/special_diamond.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  final String? email;

  const HomeScreen({super.key, this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: DrawerPage(
        email: "${widget.email}",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            showActionButton: true,
            backOnTap: () {
              scaffoldkey.currentState?.openDrawer();
            },
            image: "assets/images/person.png",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UpdateData(),
                ),
              );
            },
            title: "Welcome Archie",
            color: const Color(0xffA47842),
          ),
          Center(
            child: Stack(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                decoration: const BoxDecoration(
                  color: Color(0xffA47842),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: HomeContainer(),
              )
            ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Special Diamond",
                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                ),
                const SizedBox(
                  height: 110,
                  child: SpecialDiamond(),
                ),
                const SizedBox(height: 13),
                Text(
                  "Key Account Manager",
                  style: TextStyle(fontSize: 17.sp, color: Colors.black),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Container(
                    height: 160,
                    width: 280,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xffDCDCDC))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Image.asset(
                          "assets/images/user.png",
                          height: 60,
                        ),
                        Text("TheWebHub", style: TextStyle(fontSize: 17.sp)),
                        const SizedBox(height: 13),
                        SizedBox(
                          width: 250,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    launchUrlString("tel://+917890523641"),
                                child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child:
                                        Image.asset("assets/images/call.png")),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    launchUrlString("https://skype.//"),
                                child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                        "assets/images/skypay.png")),
                              ),
                              GestureDetector(
                                onTap: () => launchUrlString(
                                    "https://wa.me/?text=Hey buddy, try this super cool new app!"),
                                child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset("assets/images/wp.png")),
                              ),
                              GestureDetector(
                                onTap: () => launchUrlString("https://t.me/"),
                                child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                        "assets/images/telegram.png")),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
