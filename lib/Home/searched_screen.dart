import 'package:diamond_app/Home/demand_screen.dart';
import 'package:diamond_app/Home/select_shape_screen.dart';
import 'package:diamond_app/utiles/database_helper.dart';
import 'package:diamond_app/utiles/search_controller.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:diamond_app/widget/static_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ControllerSearch searchController = Get.put(ControllerSearch());
  final List<String> _temporarySelectedRanges = [];
  List<String> _appliedSelectedRanges = [];

  void _applySelections() {
    setState(() {
      _appliedSelectedRanges = List.from(_temporarySelectedRanges);
      searchController.rangeController.text = _appliedSelectedRanges.join(', ');
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DbHelper.helper.initDB();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffA47842),
          child: const Icon(
            Icons.search_sharp,
            color: Colors.white,
          ),
          onPressed: () async {
            await searchController.insertSelectedData();
          },
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
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
                                  itemCount: searchController.stageList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            searchController
                                                    .isStageSelectedList =
                                                searchController.stageList[s];
                                            searchController
                                                    .isStageSelected[s] =
                                                !searchController
                                                    .isStageSelected[s];
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: searchController
                                                          .isStageSelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: searchController
                                                      .isStageSelected[s]
                                                  ? const Color(0xffA47842)
                                                  : Colors.white),
                                          padding: const EdgeInsets.all(15),
                                          child: Text(
                                            searchController.stageList[s],
                                            style: TextStyle(
                                                color: searchController
                                                        .isStageSelected[s]
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

                              Container(
                                height: 215,
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 1.5,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5,
                                          crossAxisCount: 5,
                                          mainAxisExtent: 90),
                                  itemCount:
                                      searchController.diamondShapes.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (searchController.selectedIndices
                                              .contains(index)) {
                                            searchController.selectedIndices
                                                .remove(index);
                                          } else {
                                            searchController.selectedIndices
                                                .add(index);
                                            searchController.lastSelectedIndex =
                                                index;
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
                                                    color: searchController
                                                            .selectedIndices
                                                            .contains(index)
                                                        ? const Color(
                                                            0xffA47842)
                                                        : Colors.grey)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Image.asset(
                                                searchController
                                                        .diamondSelectedShapes[
                                                    index],
                                              ),
                                            ),
                                          ),
                                          Text(
                                              searchController
                                                  .diamondShapes[index],
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: searchController
                                                        .selectedIndices
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

                              const SizedBox(height: 10),

                              ///cateRange
                              TextFormField(
                                controller: searchController.rangeController,
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
                                                              searchController
                                                                  .ranges
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            final range =
                                                                searchController
                                                                        .ranges[
                                                                    index];
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
                                  itemCount: searchController.colorList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            searchController
                                                    .isColorCheckedList =
                                                searchController.colorList[s];
                                            searchController.isColorChecked[s] =
                                                !searchController
                                                    .isColorChecked[s];
                                          });
                                        },
                                        child: Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: searchController
                                                    .isColorChecked[s]
                                                ? [
                                                    BoxShadow(
                                                        color: const Color(
                                                                0xffA47842)
                                                            .withOpacity(0.2),
                                                        blurRadius: 10)
                                                  ]
                                                : [],
                                            border: Border.all(
                                                color: searchController
                                                        .isColorChecked[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              searchController.colorList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: searchController
                                                          .isColorChecked[s]
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
                                  itemCount:
                                      searchController.clarityList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              searchController
                                                      .isClaritySelectedList =
                                                  searchController
                                                      .clarityList[s];
                                              searchController
                                                      .isClaritySelected[s] =
                                                  !searchController
                                                      .isClaritySelected[s];
                                            });
                                          },
                                          child: Container(
                                            width: 55,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: searchController
                                                      .isClaritySelected[s]
                                                  ? [
                                                      BoxShadow(
                                                          color: const Color(
                                                                  0xffA47842)
                                                              .withOpacity(0.2),
                                                          blurRadius: 10)
                                                    ]
                                                  : [],
                                              border: Border.all(
                                                  color: searchController
                                                          .isClaritySelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                searchController.clarityList[s],
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: searchController
                                                            .isClaritySelected[s]
                                                        ? const Color(0xffA47842)
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
                                  itemCount: searchController.finishList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            searchController
                                                    .isFinishSelectedList =
                                                searchController.finishList[s];
                                            searchController
                                                    .isFinishSelected[s] =
                                                !searchController
                                                    .isFinishSelected[s];
                                          });
                                        },
                                        child: Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: searchController
                                                    .isFinishSelected[s]
                                                ? [
                                                    BoxShadow(
                                                        color: const Color(
                                                                0xffA47842)
                                                            .withOpacity(0.3),
                                                        spreadRadius: 2,
                                                        offset: Offset(0, 6),
                                                        blurRadius: 10)
                                                  ]
                                                : [],
                                            border: Border.all(
                                                color: searchController
                                                        .isFinishSelected[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              searchController.finishList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: searchController
                                                          .isFinishSelected[s]
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
                                  itemCount: searchController.cutList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            searchController.isCutSelectedList =
                                                searchController.cutList[s];
                                            searchController.isCutSelected[s] =
                                                !searchController
                                                    .isCutSelected[s];
                                          });
                                        },
                                        child: Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: searchController
                                                      .isCutSelected[s]
                                                  ? [
                                                      BoxShadow(
                                                          color: const Color(
                                                                  0xffA47842)
                                                              .withOpacity(0.2),
                                                          blurRadius: 10)
                                                    ]
                                                  : [],
                                              border: Border.all(
                                                  color: searchController
                                                          .isCutSelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: Text(
                                              searchController.cutList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: searchController
                                                          .isCutSelected[s]
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
                                  itemCount:
                                      searchController.symmetryList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            searchController
                                                    .isSymmetrySelectedList =
                                                searchController
                                                    .symmetryList[s];
                                            searchController
                                                    .isSymmetrySelected[s] =
                                                !searchController
                                                    .isSymmetrySelected[s];
                                          });
                                        },
                                        child: Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: searchController
                                                    .isSymmetrySelected[s]
                                                ? [
                                                    BoxShadow(
                                                        color: const Color(
                                                                0xffA47842)
                                                            .withOpacity(0.2),
                                                        blurRadius: 10)
                                                  ]
                                                : [],
                                            border: Border.all(
                                                color: searchController
                                                        .isSymmetrySelected[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              searchController.symmetryList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: searchController
                                                          .isSymmetrySelected[s]
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
                                  itemCount: searchController.labList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            searchController.isLabSelectedList =
                                                searchController.labList[s];
                                            searchController.isLabSelected[s] =
                                                !searchController
                                                    .isLabSelected[s];
                                          });
                                        },
                                        child: Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: searchController
                                                    .isLabSelected[s]
                                                ? [
                                                    BoxShadow(
                                                        color: const Color(
                                                                0xffA47842)
                                                            .withOpacity(0.2),
                                                        blurRadius: 10)
                                                  ]
                                                : [],
                                            border: Border.all(
                                                color: searchController
                                                        .isLabSelected[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              searchController.labList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: searchController
                                                          .isLabSelected[s]
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
                                  itemCount:
                                      searchController.locationList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            searchController
                                                    .isLocationSelectedList =
                                                searchController
                                                    .locationList[s];
                                            searchController
                                                    .isLocationSelected[s] =
                                                !searchController
                                                    .isLocationSelected[s];
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: searchController
                                                        .isLocationSelected[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ListTile(
                                            selectedColor: searchController
                                                    .isLocationSelected[s]
                                                ? const Color(0xffA47842)
                                                : Colors.white,
                                            enabled: true,
                                            leading: Image.asset(
                                              "assets/images/map.png",
                                              height: 31,
                                            ),
                                            title: Text(
                                              searchController.locationList[s],
                                              style: TextStyle(
                                                color: searchController
                                                        .isLocationSelected[s]
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
                                controller: searchController.txtcer,
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
                                  itemCount: searchController.shadesList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              searchController
                                                      .isShadesSelectedList =
                                                  searchController
                                                      .shadesList[s];
                                              searchController
                                                      .isShadesSelected[s] =
                                                  !searchController
                                                      .isShadesSelected[s];
                                            });
                                          },
                                          child: Container(
                                            // width: 55,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: searchController
                                                            .isShadesSelected[s]
                                                        ? const Color(
                                                            0xffA47842)
                                                        : Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: searchController
                                                        .isShadesSelected[s]
                                                    ? const Color(0xffA47842)
                                                    : Colors.white),
                                            padding: const EdgeInsets.all(10),
                                            child: Center(
                                              child: Text(
                                                searchController.shadesList[s],
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: searchController
                                                            .isShadesSelected[s]
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
                                  itemCount: searchController.handaList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              searchController
                                                      .isHandSelectedList =
                                                  searchController.handaList[s];
                                              searchController
                                                      .isHandASelected[s] =
                                                  !searchController
                                                      .isHandASelected[s];
                                            });
                                          },
                                          child: Container(
                                            width: 55,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: searchController
                                                      .isHandASelected[s]
                                                  ? [
                                                      BoxShadow(
                                                          color: const Color(
                                                                  0xffA47842)
                                                              .withOpacity(0.2),
                                                          blurRadius: 10)
                                                    ]
                                                  : [],
                                              border: Border.all(
                                                  color: searchController
                                                          .isHandASelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                searchController.handaList[s],
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: searchController
                                                            .isHandASelected[s]
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
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: searchController.priceList.length,
                                  itemBuilder: (context, s) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            searchController
                                                    .isPriceSelectedList =
                                                searchController.priceList[s];
                                            searchController
                                                    .isPriceSelected[s] =
                                                !searchController
                                                    .isPriceSelected[s];
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: searchController
                                                          .isPriceSelected[s]
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: searchController
                                                      .isPriceSelected[s]
                                                  ? const Color(0xffA47842)
                                                  : Colors.white),
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: Text(
                                              searchController.priceList[s],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: searchController
                                                          .isPriceSelected[s]
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
                              StaticData()
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
}
