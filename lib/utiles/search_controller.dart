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
    "ID",
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
  List<String> selectedLabs = [];

  ///location
  List locationList = ["SURAT", "DELHI"];
  List<String> isLocationSelectedList = [];

  ///shades
  List shadesList = [
    "NON",
    "Brown",
    "BLACK",
    "MIX TINCH",
  ];
  List<String> isShadesSelected = [];

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
  List<String> appliedSelectedRanges = [];

  List<String> temporarySelectedRanges = [];

  final TextEditingController rangeController = TextEditingController();
  final TextEditingController rangeFController = TextEditingController();
  final TextEditingController rangeTController = TextEditingController();

  ///Stage
  List stageList = ["ALL", "AVAILABLE", "NEW", "HOLD", "PRICE REVISED", "MEMO"];
  List<String> isStageSelectedList = [];

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
  List<String> selectedColors = [];

  ///clarity
  List clarityList = [
    "FL",
    "IF",
    "VVS1",
    "VVS2",
    "VS1",
    "VS2",
  ];
  List<String> selectedclarities = [];

  ///shap
  List<String> diamondShapes = [
    "ASSCHER",
    "CUSHION",
    "EMERALD",
    "HEART",
    "MARQUISE",
    "OVAL",
    "PEAR",
    "PRINECESS",
    "RADIANT",
    "ROUND",
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
  List<String> selectedShapes = [];

  ///Certificate
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
  double? averageValue;

  String formattedRange = "";
  List<String> ranges = [
    'Select All',
    '0.001 - 0.290',
    '0.300 - 0.390',
    '0.400 - 0.490',
    '0.500 - 0.590',
    '0.600 - 0.690',
    '0.700 - 0.790',
    '0.800 - 0.890',
    '0.900 - 0.990',
    '1.000 - 1.100',
    '1.110 - 1.490',
    '1.500 - 1.600',
    '1.610 - 1.990',
    '2.000 - 2.100',
    '2.110 - 2.490',
    '2.500 - 2.600',
    '2.610 - 2.990',
    '3.000 - 3.990',
    '3.110 - 3.490',
    '3.500 - 3.600',
    '3.610 - 3.990',
    '4.000 - 4.990',
    '5.000 - 5.990',
    '6.000 - 9.990',
    '10.000 - 20.00',
  ];
}
