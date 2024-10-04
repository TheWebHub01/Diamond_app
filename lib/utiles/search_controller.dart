import 'package:diamond_app/utiles/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'database_helper.dart';

class ControllerSearch extends GetxController {
  List<String> finishList = [
    "3EX",
    "EX",
    "VG+",
    "VG-",
  ];

  List<String> cutList = [
    "IDEAL",
    "EX",
    "VG",
    "GD",
    "FR",
  ];

  List<String> symmetryList = [
    "EX",
    "VG",
    "GD",
    "FR",
  ];

  List<String> polishList = [
    "EX",
    "VG",
    "GD",
    "FR",
  ];

  // Selection states
  String? selectedFinish;
  List<String> selectedCut = [];
  List<String> selectedSymmetry = [];
  List<String> selectedPolish = [];

  ///lab
  List labList = [
    "GIA",
    "IGI",
    "NO-CERT",
    "Other",
  ];
  List<bool> isLabSelected = [false, false, false, false];
  late String isLabSelectedList;

  ///location
  List locationList = ["Surat"];
  List<bool> isLocationSelected = [false];
  late String isLocationSelectedList;

  ///shades
  List shadesList = [
    "NO BGM",
    "Brown",
    "BLACK",
    "MIX TINCH",
  ];
  List<bool> isShadesSelected = [false, false, false, false];
  late String isShadesSelectedList;

  ///h&A
  List handaList = [
    "EX",
    "VG",
    "GD",
  ];
  List<bool> isHandASelected = [
    false,
    false,
    false,
  ];
  late String isHandSelectedList;

  ///
  int s = 0;
  int c = 0;
  final TextEditingController rangeController = TextEditingController();

  ///Stage
  List stageList = ["All", "Available", "New", "Hold", "Price Revised", "Memo"];
  List<bool> isStageSelected = [false, false, false, false, false, false];
  late String isStageSelectedList;

  /// Color
  List colorList = [
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O-P",
    "Q",
    "Fancy"
  ];
  List<bool> isColorChecked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  late String isColorCheckedList;

  ///clarity
  List clarityList = [
    "FL",
    "IF",
    "VVS1",
    "VVS2",
    "VS1",
    "VS2",
  ];
  List<bool> isClaritySelected = [false, false, false, false, false, false];
  late String isClaritySelectedList;
  List<String> diamondShapes = [
    "Asscher",
    "Cushion",
    "Emerald",
    "Heart",
    "Marquise",
    "Oval",
    "Pear",
    "Princess",
    "Radiant",
    "Round",
  ];

  List<String> diamondSelectedShapes = [
    "assets/images/asscher.png",
    "assets/images/cushion.png",
    "assets/images/emerald.png",
    "assets/images/heart.png",
    "assets/images/marquise.png",
    "assets/images/oval.png",
    "assets/images/pear.png",
    "assets/images/princ.png",
    "assets/images/radiant.png",
    "assets/images/round.png"
  ];

  List<int> selectedIndices = [];
  late String selectedDiamond;

  ///Certificate
  TextEditingController txtCert = TextEditingController();
  TextEditingController txtcer = TextEditingController();

  ///price
  List priceList = [
    "\$/CTS",
    "DISC%",
    "\$ TOTAL",
  ];
  List<bool> isPriceSelected = [false, false, false];
  late String isPriceSelectedList;
  Datacontroller datacontroller = Get.put(Datacontroller());

  ///Alert Dialog
  var txtName = TextEditingController();
  final List<Map<String, String>> combinedDiamondData = [];
  late int lastSelectedIndex;

  Future<void> insertSelectedData() async {
    DbHelper.helper.insertData(
      imName: diamondShapes[lastSelectedIndex],
      images: diamondSelectedShapes[lastSelectedIndex],
      lab: isLabSelectedList,
      stage: isStageSelectedList,
      color: isColorCheckedList,
      clarity: isClaritySelectedList,
      finish: selectedFinish,
      cut: selectedCut,
      symmetry: selectedSymmetry,
      location: isLocationSelectedList,
      certiNo: txtcer.text,
      shades: isShadesSelectedList,
      handA: isHandSelectedList,
      price:
          "\$${datacontroller.txtpfrom.text}.${datacontroller.txtpto.text} $isPriceSelectedList",
      tab: "${datacontroller.txtFromT.text}.${datacontroller.txtToT.text}",
      depth: "${datacontroller.txtFromD.text}.${datacontroller.txtToD.text}",
      lengh: "${datacontroller.txtFromL.text}.${datacontroller.txtToL.text}",
      width: "${datacontroller.txtFromW.text}.${datacontroller.txtToW.text}",
      ratio: "${datacontroller.txtFromR.text}.${datacontroller.txtToR.text}",
      crown: "\$ ${datacontroller.txtFromC.text}.${datacontroller.txtToC.text}",
      height: "${datacontroller.txtFromH.text}.${datacontroller.txtToH.text}",
      crownAngle:
          "${datacontroller.txtFromCA.text}.${datacontroller.txtToCA.text}",
      pavDepth:
          "${datacontroller.txtFromPD.text}.${datacontroller.txtToPD.text}",
      pavAngle:
          "${datacontroller.txtFromPA.text}.${datacontroller.txtToPA.text}",
    );
  }

  List<String> ranges = [
    'Select All',
    '0.01-0.29',
    '0.30-0.39',
    '0.40-0.49',
    '0.50-0.59',
    '0.60-0.69',
    '0.70-0.79',
    '0.80-0.89',
    '0.90-0.99',
    '1.00-1.10',
    '1.11-1.49',
    '1.50-1.60',
    '1.61-1.99',
    '2.00-2.10',
    '2.11-2.49',
    '2.50-2.60',
    '2.61-2.99',
    '3.00-3.10',
    '3.11-3.49',
    '3.50-3.60',
    '3.61-3.99',
    '4.00-4.99',
    '5.00-5.99',
    '6.00-9.99',
    '10.00-20.00',
  ];
}
