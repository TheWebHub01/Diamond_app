
import 'package:diamond_app/utiles/data_controller.dart';
import 'package:diamond_app/utiles/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    super.initState();
    DbHelper.helper.readData();
  }

  Datacontroller datacontroller = Get.put(Datacontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 60.h,
          child: Obx(
            () => (datacontroller.datalist.isEmpty)
                ? const Center(
                    child: Text(
                      "No\n Saved Result Found",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff929292), fontSize: 22),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Container(
                          height: 13.h,
                          width: double.infinity,
                          color: const Color(0xffA47842).withOpacity(0.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "${datacontroller.datalist[index]['stage']}"),
                                  SizedBox(
                                      height: 40,
                                      child: Image.asset(
                                          "${datacontroller.datalist[index]['images']}")),
                                  Text(
                                      "${datacontroller.datalist[index]['name']}"),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "${datacontroller.datalist[index]['clarity']}"),
                                  Text(
                                      "FIN : ${datacontroller.datalist[index]['cut']} ${datacontroller.datalist[index]['Finish']}"),
                                  Text(
                                      "FLOUR : ${datacontroller.datalist[index]['symmetry']}"),
                                  Text(
                                      "${datacontroller.datalist[index]['location']} ${datacontroller.datalist[index]['lab']}"),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "Length :${datacontroller.datalist[index]['lengh']} "),
                                  Text(
                                      "Width : ${datacontroller.datalist[index]['width']}"),
                                  Text(
                                      "Depth : ${datacontroller.datalist[index]['depth']}"),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "${datacontroller.datalist[index]['ratio']}"),
                                  Text(
                                      "${datacontroller.datalist[index]['price']}"),
                                  Text(
                                      "${datacontroller.datalist[index]['crown']}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: datacontroller.datalist.length,
                  ),
          ),
        ),
      ),
    );
  }
}
