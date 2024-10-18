import 'package:diamond_app/Home/diamond_details_screen.dart';
import 'package:diamond_app/utiles/data_controller.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:diamond_app/widget/filter_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class HoldListScreen extends StatefulWidget {
  const HoldListScreen({super.key});

  @override
  State<HoldListScreen> createState() => _HoldListScreenState();
}

class _HoldListScreenState extends State<HoldListScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  Datacontroller datacontroller = Get.put(Datacontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: const FilterDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppBar(
            showActionButton: true,
            backOnTap: () {
              Navigator.pop(context);
            },
            title: "Hold List",
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
                    Text("CTS", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("185.14"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dis%", style: TextStyle(fontWeight: FontWeight.bold)),
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
              () => (datacontroller.holdDatalist.isEmpty)
                  ? const Center(
                      child: Text(
                        "No\n Hold List Result Found",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff929292),
                          fontSize: 22,
                        ),
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
                            //           itemData:
                            //               datacontroller.holdDatalist[index]),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${datacontroller.holdDatalist[index]['stage']}"),
                                      SizedBox(
                                          height: 40,
                                          child: Image.asset(
                                              "${datacontroller.holdDatalist[index]['images']}")),
                                      Text(
                                          "${datacontroller.holdDatalist[index]['name']}"),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${datacontroller.holdDatalist[index]['clarity']}"),
                                      Text(
                                          "FIN : ${datacontroller.holdDatalist[index]['cut']} ${datacontroller.holdDatalist[index]['Finish']}"),
                                      Text(
                                          "FLOU : ${datacontroller.holdDatalist[index]['symmetry']}"),
                                      Text(
                                          "${datacontroller.holdDatalist[index]['location']} ${datacontroller.holdDatalist[index]['lab']}"),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "Length :${datacontroller.holdDatalist[index]['lengh']} "),
                                      Text(
                                          "Width : ${datacontroller.holdDatalist[index]['width']}"),
                                      Text(
                                          "Depth : ${datacontroller.holdDatalist[index]['depth']}"),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${datacontroller.holdDatalist[index]['ratio']}"),
                                      Text(
                                          "${datacontroller.holdDatalist[index]['price']}"),
                                      Text(
                                          "${datacontroller.holdDatalist[index]['crown']}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: datacontroller.holdDatalist.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
