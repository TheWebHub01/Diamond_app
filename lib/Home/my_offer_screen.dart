import 'package:diamond_app/Home/diamond_details_screen.dart';
import 'package:diamond_app/utiles/data_controller.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:diamond_app/widget/filter_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class MyOffersScreen extends StatefulWidget {
  const MyOffersScreen({super.key});

  @override
  State<MyOffersScreen> createState() => _MyOffersScreenState();
}

class _MyOffersScreenState extends State<MyOffersScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  Datacontroller datacontroller = Get.put(Datacontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: const FilterDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(
              showActionButton: true,
              backOnTap: () {
                Navigator.pop(context);
              },
              title: "Special Offer",
              onTap: () {
                scaffoldkey.currentState?.openDrawer();
              },
            ),
            Container(
              height: 11.h,
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
            SizedBox(
              height: 60.h,
              child: Obx(
                () => (datacontroller.offerDatalist.isEmpty)
                    ? const Center(
                        child: Text(
                          "No\n Special Offer Result Found",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color(0xff929292), fontSize: 22),
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => DiamondDetailsScreen(
                              //           next: false,
                              //           itemData: datacontroller
                              //               .offerDatalist[index]),
                              //     ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: Container(
                                height: 13.h,
                                width: double.infinity,
                                color: const Color(0xffA47842).withOpacity(0.2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "${datacontroller.offerDatalist[index]['stage']}"),
                                        SizedBox(
                                            height: 40,
                                            child: Image.asset(
                                                "${datacontroller.offerDatalist[index]['images']}")),
                                        Text(
                                            "${datacontroller.offerDatalist[index]['name']}"),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "${datacontroller.offerDatalist[index]['clarity']}"),
                                        Text(
                                            "FIN : ${datacontroller.offerDatalist[index]['cut']} ${datacontroller.offerDatalist[index]['Finish']}"),
                                        Text(
                                            "FLOU : ${datacontroller.offerDatalist[index]['symmetry']}"),
                                        Text(
                                            "${datacontroller.offerDatalist[index]['location']} ${datacontroller.offerDatalist[index]['lab']}"),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "Length :${datacontroller.offerDatalist[index]['lengh']} "),
                                        Text(
                                            "Width : ${datacontroller.offerDatalist[index]['width']}"),
                                        Text(
                                            "Depth : ${datacontroller.offerDatalist[index]['depth']}"),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "${datacontroller.offerDatalist[index]['ratio']}"),
                                        Text(
                                            "${datacontroller.offerDatalist[index]['price']}"),
                                        Text(
                                            "${datacontroller.offerDatalist[index]['crown']}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: datacontroller.offerDatalist.length,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
