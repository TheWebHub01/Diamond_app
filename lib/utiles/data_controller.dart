import 'package:diamond_app/utiles/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Datacontroller extends GetxController {
  RxList datalist = <Map>[].obs;
  RxList demandDatalist = <Map>[].obs;
  RxList filterDatalist = <Map>[].obs;
  RxList upcommingDatalist = <Map>[].obs;
  RxList exclusiveDatalist = <Map>[].obs;
  RxList holdDatalist = <Map>[].obs;
  RxList offerDatalist = <Map>[].obs;
  RxList imageList = <String>[
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png",
  ].obs;

  final List<Map<String, String>> diamonds = [
    {
      "imageUrl": "assets/images/1.png",
      "shape": "ROUND",
      "id": "Y06098",
      "size": "10.76",
      "igi": "-98.92%",
    },
    {
      "imageUrl": "assets/images/2.png",
      "shape": "ROUND",
      "id": "L24386",
      "size": "7.27",
      "igi": "-99.41%",
    },
    {
      "imageUrl": "assets/images/3.png",
      "shape": "ROUND",
      "id": "Y06098",
      "size": "10.76",
      "igi": "-98.92%",
    },
    {
      "imageUrl": "assets/images/4.png",
      "shape": "ROUND",
      "id": "L24386",
      "size": "7.27",
      "igi": "-99.41%",
    },
    {
      "imageUrl": "assets/images/5.png",
      "shape": "ROUND",
      "id": "Y06098",
      "size": "10.76",
      "igi": "-98.92%",
    },
    {
      "imageUrl": "assets/images/6.png",
      "shape": "ROUND",
      "id": "L24386",
      "size": "7.27",
      "igi": "-99.41%",
    },
    {
      "imageUrl": "assets/images/7.png",
      "shape": "ROUND",
      "id": "Y06098",
      "size": "10.76",
      "igi": "-98.92%",
    },
    {
      "imageUrl": "assets/images/8.png",
      "shape": "ROUND",
      "id": "L24386",
      "size": "7.27",
      "igi": "-99.41%",
    },
    {
      "imageUrl": "assets/images/9.png",
      "shape": "ROUND",
      "id": "L24386",
      "size": "7.27",
      "igi": "-99.41%",
    },
    // Add more items here
  ];

  TextEditingController txtpfrom = TextEditingController();
  TextEditingController txtpto = TextEditingController();

  ///Table
  TextEditingController txtFromT = TextEditingController();
  TextEditingController txtToT = TextEditingController();

  ///depth
  TextEditingController txtFromD = TextEditingController();
  TextEditingController txtToD = TextEditingController();

  ///lengh
  TextEditingController txtFromL = TextEditingController();
  TextEditingController txtToL = TextEditingController();

  ///Width
  TextEditingController txtFromW = TextEditingController();
  TextEditingController txtToW = TextEditingController();

  ///Ratio
  TextEditingController txtFromR = TextEditingController();
  TextEditingController txtToR = TextEditingController();

  ///Crown
  TextEditingController txtFromC = TextEditingController();
  TextEditingController txtToC = TextEditingController();

  ///H&A
  TextEditingController txtFromH = TextEditingController();
  TextEditingController txtToH = TextEditingController();

  ///Crown Angle
  TextEditingController txtFromCA = TextEditingController();
  TextEditingController txtToCA = TextEditingController();

  ///Pav Depth
  TextEditingController txtFromPD = TextEditingController();
  TextEditingController txtToPD = TextEditingController();

  ///Pav Angle
  TextEditingController txtFromPA = TextEditingController();
  TextEditingController txtToPA = TextEditingController();





  Future<void> readdata() async {
    datalist.value = await DbHelper.helper.readData();
    upcommingDatalist.value = await DbHelper.helper.readData();
  }

  void deletdata(int id) {
    DbHelper.helper.deleteData(id: id);
    readdata();
  }
}
