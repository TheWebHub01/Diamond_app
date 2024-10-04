import 'package:diamond_app/excel/excel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:diamond_app/Register/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) => MaterialApp(
<<<<<<< HEAD
=======
        theme: ThemeData(primaryColor: Colors.black),
>>>>>>> 4f1f1556c83e6336d188e9bd3d81a5bbc3fc3c7d
        title: 'Flutter Demo',
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: const ExcelScreen(),
      ),
    );
  }
}
