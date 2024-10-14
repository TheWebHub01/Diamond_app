import 'package:diamond_app/Register/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures that binding is initialized
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diamond Search',
        home: SplashScreen(),
      ),
    );
  }
}
