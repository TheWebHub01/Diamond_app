import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String? image;
  final bool showActionButton;
  void Function()? onTap;
  void Function()? backOnTap;
  Color? color;

  CustomAppBar(
      {super.key,
      required this.showActionButton,
      required this.title,
      this.onTap,
      this.image,
      this.backOnTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: backOnTap,
              child: Image.asset("assets/images/Frame.png",
                  height: 25,
                  color: color != null ? Colors.white : Colors.black),
            ),
            Text(
              title,
              style: TextStyle(
                  color: color != null ? Colors.white : Colors.black,
                  fontSize: 20),
            ),
            if (showActionButton)
              GestureDetector(
                onTap: onTap,
                child: Image.asset(
                    image != null
                        ? "assets/images/person.png"
                        : "assets/images/filtter.png",
                    height: 25,
                    color: color != null ? Colors.white : Colors.black),
              )
            else
              SizedBox(width: 6.w),
          ],
        ),
      ),
    );
  }
}
