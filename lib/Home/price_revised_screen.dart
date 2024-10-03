import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:diamond_app/widget/filter_drawer.dart';
import 'package:flutter/material.dart';

class PriceRevisedScreen extends StatefulWidget {
  const PriceRevisedScreen({super.key});

  @override
  State<PriceRevisedScreen> createState() => _PriceRevisedScreenState();
}

class _PriceRevisedScreenState extends State<PriceRevisedScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        drawer: const FilterDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(
              backOnTap: () {
                Navigator.pop(context);
              },
              showActionButton: true,
              title: "Price Revised",
              onTap: () {
                scaffoldkey.currentState?.openDrawer();
              },
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: const Color(0xffA47842).withOpacity(0.2),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pcs",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("50"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("CTS",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("185.14"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dis%",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("99.47"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Price/CT",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("199"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Value",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("36906"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            const Center(
              child: Text(
                "No\n Price Revised Result Found",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff929292), fontSize: 22),
              ),
            )
          ],
        ),
      ),
    );
  }
}
