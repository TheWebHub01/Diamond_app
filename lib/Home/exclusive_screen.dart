import 'package:diamond_app/Home/diamond_details_screen.dart';
import 'package:diamond_app/utiles/data_controller.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:diamond_app/widget/filter_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ExclusiveScreen extends StatefulWidget {
  const ExclusiveScreen({super.key});

  @override
  State<ExclusiveScreen> createState() => _ExclusiveScreenState();
}

class _ExclusiveScreenState extends State<ExclusiveScreen> {
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
              backOnTap: () {
                Navigator.pop(context);
              },
              showActionButton: true,
              onTap: () {
                scaffoldkey.currentState?.openDrawer();
              },
              title: "Exclusive Stone",
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
                () => (datacontroller.exclusiveDatalist.isEmpty)
                    ? const Center(
                        child: Text(
                          "No\n Exclusive Stones Result Found",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color(0xff929292), fontSize: 22),
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => DiamondDetailsScreen(
                                //         next: false,
                                //         itemData: datacontroller
                                //             .exclusiveDatalist[index]),
                                //   ),
                                // );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8.0,
                                ),
                                child: Container(
                                  height: 13.h,
                                  width: double.infinity,
                                  color:
                                      const Color(0xffA47842).withOpacity(0.2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${datacontroller.exclusiveDatalist[index]['stage']}"),
                                          SizedBox(
                                              height: 40,
                                              child: Image.asset(
                                                  "${datacontroller.exclusiveDatalist[index]['images']}")),
                                          Text(
                                              "${datacontroller.exclusiveDatalist[index]['name']}"),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${datacontroller.exclusiveDatalist[index]['clarity']}"),
                                          Text(
                                              "FIN : ${datacontroller.exclusiveDatalist[index]['cut']} ${datacontroller.exclusiveDatalist[index]['Finish']}"),
                                          Text(
                                              "FLOU : ${datacontroller.exclusiveDatalist[index]['symmetry']}"),
                                          Text(
                                              "${datacontroller.exclusiveDatalist[index]['location']} ${datacontroller.exclusiveDatalist[index]['lab']}"),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "Length :${datacontroller.exclusiveDatalist[index]['lengh']} "),
                                          Text(
                                              "Width : ${datacontroller.exclusiveDatalist[index]['width']}"),
                                          Text(
                                              "Depth : ${datacontroller.exclusiveDatalist[index]['depth']}"),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${datacontroller.exclusiveDatalist[index]['ratio']}"),
                                          Text(
                                              "${datacontroller.exclusiveDatalist[index]['price']}"),
                                          Text(
                                              "${datacontroller.exclusiveDatalist[index]['crown']}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: datacontroller.exclusiveDatalist.length,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
