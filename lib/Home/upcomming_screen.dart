import 'package:diamond_app/Home/diamond_details_screen.dart';
import 'package:diamond_app/utiles/data_controller.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:diamond_app/widget/filter_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  Datacontroller datacontroller = Get.put(Datacontroller());
  var scaffoldkey = GlobalKey<ScaffoldState>();

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
                title: "Upcomming",
                backOnTap: () {
                  Navigator.pop(context);
                },
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
                  () => (datacontroller.upcommingDatalist.isEmpty)
                      ? const Center(
                          child: Text("No\n UpComing Result Found",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff929292), fontSize: 22)),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           DiamondDetailsScreen(
                                //               next: true,
                                //               itemData: datacontroller
                                //                   .upcommingDatalist[index]),
                                //     ));
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
                                              "${datacontroller.upcommingDatalist[index]['stage']}"),
                                          SizedBox(
                                              height: 40,
                                              child: Image.asset(
                                                  "${datacontroller.upcommingDatalist[index]['images']}")),
                                          Text(
                                              "${datacontroller.upcommingDatalist[index]['name']}"),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${datacontroller.upcommingDatalist[index]['clarity']}"),
                                          Text(
                                              "FIN : ${datacontroller.upcommingDatalist[index]['cut']} ${datacontroller.upcommingDatalist[index]['Finish']}"),
                                          Text(
                                              "FLOU : ${datacontroller.upcommingDatalist[index]['symmetry']}"),
                                          Text(
                                              "${datacontroller.upcommingDatalist[index]['location']} ${datacontroller.upcommingDatalist[index]['lab']}"),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "Length :${datacontroller.upcommingDatalist[index]['lengh']} "),
                                          Text(
                                              "Width : ${datacontroller.upcommingDatalist[index]['width']}"),
                                          Text(
                                              "Depth : ${datacontroller.upcommingDatalist[index]['depth']}"),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${datacontroller.upcommingDatalist[index]['ratio']}"),
                                          Text(
                                              "${datacontroller.upcommingDatalist[index]['price']}"),
                                          Text(
                                              "${datacontroller.upcommingDatalist[index]['crown']}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: datacontroller.datalist.length,
                        ),
                ),
              ),
            ],
          ),
        ));
  }
}

class UpcomingItem {
  final String name;
  final String imageUrl;
  final String date;
  final String description;

  UpcomingItem({
    required this.name,
    required this.imageUrl,
    required this.date,
    required this.description,
  });
}

class UpcomingItemCard extends StatelessWidget {
  final UpcomingItem upcomingItem;

  const UpcomingItemCard({super.key, required this.upcomingItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              upcomingItem.imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  upcomingItem.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 4),
                Text(
                  'Date: ${upcomingItem.date}',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  upcomingItem.description,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
