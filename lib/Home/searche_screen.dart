import 'dart:async';
import 'package:diamond_app/Home/demand_screen.dart';
import 'package:diamond_app/Home/select_shape_screen.dart';
import 'package:diamond_app/utiles/data_controller.dart';
import 'package:diamond_app/utiles/database_helper.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> _temporarySelectedRanges = [];
  List<String> _appliedSelectedRanges = [];

  void _applySelections() {
    setState(() {
      _appliedSelectedRanges = List.from(_temporarySelectedRanges);
      _rangeController.text = _appliedSelectedRanges.join(', ');
      Navigator.pop(context);
    });
  }

  ///finish
  List finishList = [
    "3EX",
    "EX",
    "VG+",
    "VG-",
  ];
  List<bool> isFinishSelected = [false, false, false, false];
  late String isFinishSelectedList;

  ///cut
  List cutList = [
    "IDEAL",
    "EX",
    "VG",
    "GD",
    "GD",
  ];
  List<bool> isCutSelected = [false, false, false, false, false];
  late String isCutSelectedList;

  ///symmetry
  List symmetryList = [
    "EX",
    "VG",
    "GD",
    "FR",
  ];
  List<bool> isSymmetrySelected = [false, false, false, false];
  late String isSymmetrySelectedList;

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
  final TextEditingController _rangeController = TextEditingController();

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
      finish: isFinishSelectedList,
      cut: isCutSelectedList,
      symmetry: isSymmetrySelectedList,
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DbHelper.helper.initDB();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xffA47842),
            child: const Icon(
              Icons.search_sharp,
              color: Colors.white,
            ),
            onPressed: () async {
              await insertSelectedData();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  backOnTap: () {
                    Navigator.pop(context);
                  },
                  showActionButton: false,
                  title: "Search",
                ),
                Container(
                  height: 57,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TabBar(
                    dividerHeight: 0,
                    padding: const EdgeInsets.all(10),
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelPadding: const EdgeInsets.only(left: 5),
                    dividerColor: Colors.white,
                    unselectedLabelColor: Colors.grey.shade500,
                    labelColor: Colors.black,
                    indicatorColor: Colors.brown,
                    tabs: const [
                      Center(
                          child: Text("Search", textAlign: TextAlign.center)),
                      Center(child: Text("Saved", textAlign: TextAlign.center)),
                      Center(
                          child: Text("Demand", textAlign: TextAlign.center)),
                    ],
                  ),
                ),

                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Stage",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: stageList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isStageSelectedList = stageList[s];
                                            isStageSelected[s] =
                                                !isStageSelected[s];
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: isStageSelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: isStageSelected[s]
                                                  ? const Color(0xffA47842)
                                                  : Colors.white),
                                          padding: const EdgeInsets.all(15),
                                          child: Text(
                                            stageList[s],
                                            style: TextStyle(
                                                color: isStageSelected[s]
                                                    ? Colors.white
                                                    : Colors.grey),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height: 2.h),

                              /// Diamond Shape
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Diamond Shape",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),

                              SizedBox(
                                height: 205,
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 1.5,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5,
                                          crossAxisCount: 5,
                                          mainAxisExtent: 90),
                                  itemCount: diamondShapes.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (selectedIndices.contains(index)) {
                                            selectedIndices.remove(index);
                                          } else {
                                            selectedIndices.add(index);
                                            lastSelectedIndex = index;
                                          }
                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: selectedIndices
                                                            .contains(index)
                                                        ? const Color(
                                                            0xffA47842)
                                                        : Colors.grey)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Image.asset(
                                                diamondSelectedShapes[index],
                                              ),
                                            ),
                                          ),
                                          Text(diamondShapes[index],
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: selectedIndices
                                                        .contains(index)
                                                    ? const Color(0xffA47842)
                                                    : Colors.black,
                                              )),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              ///cateRange

                              TextFormField(
                                controller: _rangeController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Carat Range",
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
                                    suffixIcon: IconButton(
                                      onPressed: () async {
                                        await showModalBottomSheet<
                                                List<String>>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter setState) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(height: 1.h),
                                                      const Text(
                                                        'Select Ranges',
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      SizedBox(
                                                        height: 310,
                                                        child: GridView.builder(
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      3,
                                                                  mainAxisExtent:
                                                                      60),
                                                          itemCount:
                                                              ranges.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            final range =
                                                                ranges[index];
                                                            final isSelected =
                                                                _temporarySelectedRanges
                                                                    .contains(
                                                                        range);
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (isSelected) {
                                                                      _temporarySelectedRanges
                                                                          .remove(
                                                                              range);
                                                                    } else {
                                                                      _temporarySelectedRanges
                                                                          .add(
                                                                              range);
                                                                    }
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width:
                                                                              2,
                                                                          color: isSelected
                                                                              ? const Color(
                                                                                  0xffA47842)
                                                                              : Colors
                                                                                  .grey.shade300),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: Colors
                                                                          .white),
                                                                  child: Center(
                                                                    child: Text(
                                                                      range,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: isSelected
                                                                              ? const Color(0xffA47842)
                                                                              : Colors.grey,
                                                                          fontSize: 12),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                  context,
                                                                );
                                                              },
                                                              child: Container(
                                                                height: 50,
                                                                width: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: const Color(
                                                                      0xffE1E1E1),
                                                                ),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                      "Clear"),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                return _applySelections();
                                                              },
                                                              child: Container(
                                                                height: 50,
                                                                width: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: const Color(
                                                                      0xffA47842),
                                                                ),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "Apply",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                },
                                              );
                                            });
                                      },
                                      color: const Color(0xffAA864E),
                                      icon: const Icon(
                                        Icons.expand_circle_down_rounded,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: "From",
                                        labelStyle:
                                            const TextStyle(color: Colors.grey),
                                        focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                      child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      labelText: "To",
                                      labelStyle:
                                          const TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(height: 3.h),

                              /// color
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Color",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: colorList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isColorCheckedList = colorList[s];
                                            isColorChecked[s] =
                                                !isColorChecked[s];
                                          });
                                        },
                                        child: Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: isColorChecked[s]
                                                ? [
                                                    BoxShadow(
                                                        color: const Color(
                                                                0xffA47842)
                                                            .withOpacity(0.2),
                                                        blurRadius: 10)
                                                  ]
                                                : [],
                                            border: Border.all(
                                                color: isColorChecked[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              colorList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: isColorChecked[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),

                              ///clarity
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Clarity",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: clarityList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isClaritySelectedList =
                                                  clarityList[s];
                                              isClaritySelected[s] =
                                                  !isClaritySelected[s];
                                            });
                                          },
                                          child: Container(
                                            width: 55,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: isClaritySelected[s]
                                                  ? [
                                                      BoxShadow(
                                                          color: const Color(
                                                                  0xffA47842)
                                                              .withOpacity(0.2),
                                                          blurRadius: 10)
                                                    ]
                                                  : [],
                                              border: Border.all(
                                                  color: isClaritySelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                clarityList[s],
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: isClaritySelected[s]
                                                        ? const Color(
                                                            0xffA47842)
                                                        : Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ),

                              ///Finish
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Finish",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: finishList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isFinishSelectedList =
                                                finishList[s];
                                            isFinishSelected[s] =
                                                !isFinishSelected[s];
                                          });
                                        },
                                        child: Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: isFinishSelected[s]
                                                ? [
                                                    BoxShadow(
                                                        color: const Color(
                                                                0xffA47842)
                                                            .withOpacity(0.2),
                                                        blurRadius: 10)
                                                  ]
                                                : [],
                                            border: Border.all(
                                                color: isFinishSelected[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              finishList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: isFinishSelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              ///cut
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Cut",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cutList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isCutSelectedList = cutList[s];
                                            isCutSelected[s] =
                                                !isCutSelected[s];
                                          });
                                        },
                                        child: Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: isCutSelected[s]
                                                  ? [
                                                      BoxShadow(
                                                          color: const Color(
                                                                  0xffA47842)
                                                              .withOpacity(0.2),
                                                          blurRadius: 10)
                                                    ]
                                                  : [],
                                              border: Border.all(
                                                  color: isCutSelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: Text(
                                              cutList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: isCutSelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              /// symmetry
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Symmetry",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),

                              SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: symmetryList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isSymmetrySelectedList =
                                                symmetryList[s];
                                            isSymmetrySelected[s] =
                                                !isSymmetrySelected[s];
                                          });
                                        },
                                        child: Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: isSymmetrySelected[s]
                                                ? [
                                                    BoxShadow(
                                                        color: const Color(
                                                                0xffA47842)
                                                            .withOpacity(0.2),
                                                        blurRadius: 10)
                                                  ]
                                                : [],
                                            border: Border.all(
                                                color: isSymmetrySelected[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              symmetryList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: isSymmetrySelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              ///lab

                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Lab",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 65,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: labList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isLabSelectedList = labList[s];
                                            isLabSelected[s] =
                                                !isLabSelected[s];
                                          });
                                        },
                                        child: Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: isLabSelected[s]
                                                ? [
                                                    BoxShadow(
                                                        color: const Color(
                                                                0xffA47842)
                                                            .withOpacity(0.2),
                                                        blurRadius: 10)
                                                  ]
                                                : [],
                                            border: Border.all(
                                                color: isLabSelected[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              labList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: isLabSelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              ///Location
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Location",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 2.h),
                              SizedBox(
                                height: 80,
                                child: ListView.builder(
                                  itemCount: locationList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isLocationSelectedList =
                                                locationList[s];
                                            isLocationSelected[s] =
                                                !isLocationSelected[s];
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: isLocationSelected[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ListTile(
                                            selectedColor: isLocationSelected[s]
                                                ? const Color(0xffA47842)
                                                : Colors.white,
                                            enabled: true,
                                            leading: Image.asset(
                                              "assets/images/map.png",
                                              height: 31,
                                            ),
                                            title: Text(
                                              locationList[s],
                                              style: TextStyle(
                                                color: isLocationSelected[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              ///certificate No./Lot No.
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Certificate No./Lot No.",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 2.h),
                              TextFormField(
                                controller: txtcer,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(15)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  suffixIcon:
                                      Image.asset("assets/images/cer.png"),
                                  labelText: "Certificate No./Lot No.",
                                ),
                              ),
                              SizedBox(height: 2.h),

                              ///shades
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Shades",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: shadesList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isShadesSelectedList =
                                                  shadesList[s];
                                              isShadesSelected[s] =
                                                  !isShadesSelected[s];
                                            });
                                          },
                                          child: Container(
                                            // width: 55,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: isShadesSelected[s]
                                                        ? const Color(
                                                            0xffA47842)
                                                        : Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: isShadesSelected[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.white),
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                              child: Text(
                                                shadesList[s],
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: isShadesSelected[s]
                                                        ? Colors.white
                                                        : Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ),

                              ///H&A
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "H&A",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),

                              SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: handaList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isHandSelectedList = handaList[s];
                                              isHandASelected[s] =
                                                  !isHandASelected[s];
                                            });
                                          },
                                          child: Container(
                                            width: 55,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: isHandASelected[s]
                                                  ? [
                                                      BoxShadow(
                                                          color: const Color(
                                                                  0xffA47842)
                                                              .withOpacity(0.2),
                                                          blurRadius: 10)
                                                    ]
                                                  : [],
                                              border: Border.all(
                                                  color: isHandASelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                handaList[s],
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: isHandASelected[s]
                                                        ? const Color(
                                                            0xffA47842)
                                                        : Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ),

                              ///price

                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF4F4F4),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      const Text(
                                        "Price",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffAA864E),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: priceList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isPriceSelectedList = priceList[s];
                                            isPriceSelected[s] =
                                                !isPriceSelected[s];
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: isPriceSelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: isPriceSelected[s]
                                                  ? const Color(0xffA47842)
                                                  : Colors.white),
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: Text(
                                              priceList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: isPriceSelected[s]
                                                      ? Colors.white
                                                      : Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              staticData()
                            ],
                          ),
                        ),
                      ),
                      const SavedScreen(),
                      const DemandScreen()
                    ],
                  ),
                ),

                /// Insert, demand, Save
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     ElevatedButton(
                //         onPressed: () async {
                //           await insertSelectedData();
                //         },
                //         child: const Text("Insert")),
                //     ElevatedButton(
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => SelectedShapesScreen(
                //                 selectedIndices: selectedIndices,
                //                 diamondShapes: diamondShapes,
                //                 diamondSelectedShapes: diamondSelectedShapes,
                //               ),
                //             ),
                //           );
                //         },
                //         child: const Text("demand")),
                //     ElevatedButton(
                //         onPressed: () async {
                //           await insertSelectedData();
                //         },
                //         child: const Text("Save")),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget staticData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: datacontroller.txtpfrom,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: datacontroller.txtpto,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Table%",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: datacontroller.txtFromT,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: datacontroller.txtToT,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Depth%",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: datacontroller.txtFromD,
                decoration: InputDecoration(
                  labelText: "From",
                  labelStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: datacontroller.txtToD,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: "To",
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Lengh",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: datacontroller.txtFromL,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: datacontroller.txtToL,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Width",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: datacontroller.txtFromW,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              controller: datacontroller.txtToW,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Ratio",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: datacontroller.txtFromR,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: datacontroller.txtToR,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Crown",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: datacontroller.txtFromC,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: datacontroller.txtToC,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Height",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: datacontroller.txtFromH,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              controller: datacontroller.txtToH,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Crown Angle",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: datacontroller.txtFromCA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              controller: datacontroller.txtToCA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Pav Depth",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: datacontroller.txtFromPD,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              controller: datacontroller.txtToPD,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Pav Angle",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: datacontroller.txtFromPA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              controller: datacontroller.txtToPA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
      ],
    );
  }
}
