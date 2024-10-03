import 'package:diamond_app/Register/login_screen.dart';
import 'package:diamond_app/Register/register_screen.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/Frame.png",
                  width: 23,
                  height: 23,
                ),
              ),
              SizedBox(height: 1.h),
              const Text(
                "Go ahead and set up \nyour account",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              const Text(
                "Sign in-up to enjoy the best managing experience",
                style: TextStyle(color: Color(0xff727272), fontSize: 12),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  dividerHeight: 0,
                  padding: const EdgeInsets.all(8),
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelPadding: const EdgeInsets.only(left: 5),
                  dividerColor: Colors.white,
                  unselectedLabelColor: const Color(0xff828282),
                  labelColor: const Color(0xff000000),
                  indicatorColor: const Color(0xffA47842),
                  tabs: const [
                    Center(child: Text("Login")),
                    Center(child: Text("Register")),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [const SignInScreen(), SignUpScreen()],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
