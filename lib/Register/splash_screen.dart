import 'dart:async';
import 'package:diamond_app/Home/home_screen.dart';
import 'package:diamond_app/Register/tab_bar_screen.dart';
import 'package:diamond_app/utiles/sherd_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    selectscreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover),
              ),
            ),
            const Center(
              child: SizedBox(
                height: 180,
                width: 180,
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectscreen() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TabBarScreen(),
              ));
        },
      );
    }
  }
}
