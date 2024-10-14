import 'package:diamond_app/widget/static_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../utiles/search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ControllerSearch searchController = Get.put(ControllerSearch());
  void _updateRangesFromText() {
    setState(() {
      // Split the text by commas and trim whitespace
      searchController.temporarySelectedRanges = searchController
          .rangeController.text
          .split(',')
          .map((e) => e.trim())
          .toList();
      // Remove any empty strings from the list
      searchController.temporarySelectedRanges
          .removeWhere((range) => range.isEmpty);
    });
  }

  void _applySelections() {
    setState(() {
      searchController.appliedSelectedRanges =
          List.from(searchController.temporarySelectedRanges);
      searchController.rangeController.text =
          searchController.appliedSelectedRanges.join(', ');
      Navigator.pop(context);
    });
  }

  void autoSelectItems(String finish) {
    setState(() {
      searchController.selectedFinish = finish;
      searchController.selectedCut = [];
      searchController.selectedSymmetry = [];
      searchController.selectedPolish = [];

      switch (finish) {
        case "3EX":
          searchController.selectedCut = ["ID", "EX"];
          searchController.selectedSymmetry = ["EX"];
          searchController.selectedPolish = ["EX"];
          break;
        case "EX":
          searchController.selectedCut = ["EX"];
          searchController.selectedSymmetry = ["EX", "VG"];
          searchController.selectedPolish = ["EX", "VG"];
          break;
        case "VG+":
          searchController.selectedCut = ["ID", "EX", "VG"];
          searchController.selectedSymmetry = ["EX", "VG"];
          searchController.selectedPolish = ["EX", "VG"];
          break;
        case "VG-":
          searchController.selectedCut = ["VG"];
          searchController.selectedSymmetry = ["GD", "VG"];
          searchController.selectedPolish = ["GD", "VG"];
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
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
                  String stage = searchController.stageList[s];
                  bool isSelected =
                      searchController.isStageSelectedList.contains(stage);

                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            searchController.isStageSelectedList.remove(stage);
                          } else {
                            searchController.isStageSelectedList.add(stage);

                            print(
                                "searchController.isStageSelectedList:=>${searchController.isStageSelectedList}");
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xffA47842)
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: isSelected
                              ? const Color(0xffA47842)
                              : Colors.white,
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          stage,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                          ),
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
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
                ),
              ]),
            ),

            Container(
              height: 215,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2.0,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  crossAxisCount: 5,
                  mainAxisExtent: 90,
                ),
                itemCount: searchController.diamondShapes.length,
                itemBuilder: (context, index) {
                  String diamondShape = searchController.diamondShapes[index];
                  bool isSelected =
                      searchController.selectedShapes.contains(diamondShape);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          searchController.selectedShapes.remove(diamondShape);
                        } else {
                          searchController.selectedShapes.add(diamondShape);
                        }
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xffA47842)
                                  : Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              searchController.diamondSelectedShapes[index],
                            ),
                          ),
                        ),
                        Text(
                          diamondShape,
                          style: TextStyle(
                            fontSize: 10,
                            color: isSelected
                                ? const Color(0xffA47842)
                                : Colors.black,
                          ),
                        ),
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
              onChanged: (value) {
                _updateRangesFromText(); // Update ranges as user types
              },
              decoration: InputDecoration(
                labelText: "Carat Range",
                labelStyle: const TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.expand_circle_down_rounded),
                  onPressed: () async {
                    await showModalBottomSheet<List<String>>(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 16),
                                const Text(
                                  'Select Ranges',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16),
                                SizedBox(
                                  height: 310,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisExtent: 60,
                                    ),
                                    itemCount: searchController.ranges.length,
                                    itemBuilder: (context, index) {
                                      final range =
                                          searchController.ranges[index];
                                      final isSelected = searchController
                                          .temporarySelectedRanges
                                          .contains(range);
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isSelected) {
                                                // If already selected, remove it
                                                searchController
                                                    .temporarySelectedRanges
                                                    .remove(range);
                                              } else {
                                                // If not selected, add it
                                                searchController
                                                    .temporarySelectedRanges
                                                    .add(range);
                                              }
                                              // Update the TextFormField with selected ranges
                                              searchController
                                                      .rangeController.text =
                                                  searchController
                                                      .temporarySelectedRanges
                                                      .join(', ');
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 2,
                                                color: isSelected
                                                    ? const Color(0xffA47842)
                                                    : Colors.grey.shade300,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: Text(
                                                range,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: isSelected
                                                      ? const Color(0xffA47842)
                                                      : Colors.grey,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(
                                              context); // Close without applying changes
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xffE1E1E1),
                                          ),
                                          child: const Center(
                                            child: Text("Clear"),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _applySelections(); // Apply selected ranges
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xffA47842),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Apply",
                                              style: TextStyle(
                                                  color: Colors.white),
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
                      },
                    );
                  },
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            searchController.rangeController.text.isNotEmpty
                ? Container()
                : Row(
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "From",
                            labelStyle: const TextStyle(color: Colors.grey),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: "To",
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
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
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: searchController.colorList.length,
                itemBuilder: (context, s) {
                  String color =
                      searchController.colorList[s]; // Get the current color
                  bool isSelected = searchController.selectedColors
                      .contains(color); // Check if this color is selected

                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            // If already selected, remove from the list
                            searchController.selectedColors.remove(color);
                          } else {
                            // If not selected, add to the list
                            searchController.selectedColors.add(color);
                          }
                        });
                      },
                      child: Container(
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: const Color(0xffA47842)
                                        .withOpacity(0.2),
                                    blurRadius: 10,
                                  )
                                ]
                              : [],
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xffA47842)
                                : Colors.grey,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            color,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: isSelected
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

            const SizedBox(height: 10),

            ///clarity
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF4F4F4),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
                ),
              ]),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: searchController.clarityList.length,
                itemBuilder: (context, s) {
                  String clarity = searchController.clarityList[s];
                  bool isSelected =
                      searchController.selectedclarities.contains(clarity);

                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            searchController.selectedclarities.remove(clarity);
                          } else {
                            searchController.selectedclarities.add(clarity);
                          }
                        });
                      },
                      child: Container(
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: const Color(0xffA47842)
                                        .withOpacity(0.2),
                                    blurRadius: 10,
                                  )
                                ]
                              : [],
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xffA47842)
                                : Colors.grey,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            clarity,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: isSelected
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

            ///Finish
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF4F4F4),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
                ),
              ]),
            ),
            Wrap(
              spacing: 8.0,
              children: searchController.finishList.map((item) {
                return customChoiceChip(
                  label: item,
                  selected: searchController.selectedFinish == item,
                  onSelected: (_) => onFinishSelect(item),
                );
              }).toList(),
            ),

            ///cut
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF4F4F4),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
                ),
              ]),
            ),

            buildSelectableCutList(searchController.cutList,
                searchController.selectedCut, onCutSelect),

            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF4F4F4),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
                ),
                SizedBox(
                  width: 2.w,
                ),
                const Text(
                  "Polish",
                  style: TextStyle(color: Colors.black),
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
                ),
              ]),
            ),
            buildSelectableSymmetryList(searchController.polishList,
                searchController.selectedPolish, onPolishSelect),

            /// symmetry
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF4F4F4),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
                ),
              ]),
            ),
            buildSelectableSymmetryList(searchController.symmetryList,
                searchController.selectedSymmetry, onSymmetrySelect),

            ///lab

            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF4F4F4),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
                ),
              ]),
            ),
            SizedBox(
              height: 65,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: searchController.labList.length,
                itemBuilder: (context, s) {
                  final lab = searchController.labList[s];
                  final isSelected =
                      searchController.selectedLabs.contains(lab);

                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            // Remove from selected list if already selected
                            searchController.selectedLabs.remove(lab);
                          } else {
                            // Add to selected list if not selected
                            searchController.selectedLabs.add(lab);
                          }
                        });
                      },
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: const Color(0xffA47842)
                                        .withOpacity(0.2),
                                    blurRadius: 10,
                                  ),
                                ]
                              : [],
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xffA47842)
                                : Colors.grey,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            lab,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: isSelected
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

            ///Location
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffF4F4F4),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
                ),
              ]),
            ),
            SizedBox(height: 2.h),
            SizedBox(
              height: 80,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: searchController.locationList.length,
                itemBuilder: (context, s) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          searchController.isLocationSelectedList =
                              searchController.locationList[s];
                          searchController.isLocationSelected[s] =
                              !searchController.isLocationSelected[s];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: searchController.isLocationSelected[s]
                                  ? const Color(0xffA47842)
                                  : Colors.grey,
                              width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          selectedColor: searchController.isLocationSelected[s]
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
                              color: searchController.isLocationSelected[s]
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
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
                ),
              ]),
            ),
            SizedBox(height: 2.h),
            TextFormField(
              controller: searchController.txtcer,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelStyle: const TextStyle(color: Colors.grey),
                suffixIcon: Image.asset("assets/images/cer.png"),
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
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
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
                            searchController.isShadesSelectedList =
                                searchController.shadesList[s];
                            searchController.isShadesSelected[s] =
                                !searchController.isShadesSelected[s];
                          });
                        },
                        child: Container(
                          // width: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: searchController.isShadesSelected[s]
                                      ? const Color(0xffA47842)
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color: searchController.isShadesSelected[s]
                                  ? const Color(0xffA47842)
                                  : Colors.white),
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              searchController.shadesList[s],
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: searchController.isShadesSelected[s]
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
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
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
                            searchController.isHandSelectedList =
                                searchController.handaList[s];
                            searchController.isHandASelected[s] =
                                !searchController.isHandASelected[s];
                          });
                        },
                        child: Container(
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: searchController.isHandASelected[s]
                                ? [
                                    BoxShadow(
                                        color: const Color(0xffA47842)
                                            .withOpacity(0.2),
                                        blurRadius: 10)
                                  ]
                                : [],
                            border: Border.all(
                                color: searchController.isHandASelected[s]
                                    ? const Color(0xffA47842)
                                    : Colors.grey),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              searchController.handaList[s],
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: searchController.isHandASelected[s]
                                      ? const Color(0xffA47842)
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
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA864E),
                      borderRadius: BorderRadius.circular(3)),
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
                      borderRadius: BorderRadius.circular(3)),
                ),
              ]),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: searchController.priceList.length,
                itemBuilder: (context, s) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          searchController.isPriceSelectedList =
                              searchController.priceList[s];
                          searchController.isPriceSelected[s] =
                              !searchController.isPriceSelected[s];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: searchController.isPriceSelected[s]
                                    ? const Color(0xffA47842)
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            color: searchController.isPriceSelected[s]
                                ? const Color(0xffA47842)
                                : Colors.white),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            searchController.priceList[s],
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: searchController.isPriceSelected[s]
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
    );
  }

  void _formatRange() {
    double fromValue =
        double.tryParse(searchController.datacontroller.txtFromD.text) ?? 0.0;
    double toValue =
        double.tryParse(searchController.datacontroller.txtToD.text) ?? 0.0;

    // Format to 3 decimal places
    String fromFormatted = fromValue.toStringAsFixed(3);
    String toFormatted = toValue.toStringAsFixed(3);

    setState(() {
      searchController.formattedRange = "$fromFormatted - $toFormatted";
    });
  }

  Widget buildSelectableList(
      List<String> list, String? selectedItem, Function(String) onSelect) {
    return Wrap(
      spacing: 8.0,
      children: list.map((item) {
        return customChoiceChip(
          label: item,
          selected: selectedItem == item,
          onSelected: (_) => onSelect(item),
        );
      }).toList(),
    );
  }

  // Custom ChoiceChip for cut list
  Widget buildSelectableCutList(List<String> list, List<String> selectedItems,
      Function(String) onSelect) {
    return Wrap(
      spacing: 8.0,
      children: list.map((item) {
        return customChoiceChip(
          label: item,
          selected: selectedItems.contains(item),
          onSelected: (_) {
            onSelect(item);
          },
        );
      }).toList(),
    );
  }

  // Custom ChoiceChip for symmetry list
  Widget buildSelectableSymmetryList(List<String> list,
      List<String> selectedItems, Function(String) onSelect) {
    return Wrap(
      spacing: 8.0,
      children: list.map((item) {
        return customChoiceChip(
          label: item,
          selected: selectedItems.contains(item),
          onSelected: (_) {
            onSelect(item);
          },
        );
      }).toList(),
    );
  }

  // Custom ChoiceChip for polish list
  Widget buildSelectablePolishList(List<String> list,
      List<String> selectedItems, Function(String) onSelect) {
    return Wrap(
      spacing: 8.0,
      children: list.map((item) {
        return customChoiceChip(
          label: item,
          selected: selectedItems.contains(item),
          onSelected: (_) {
            onSelect(item);
          },
        );
      }).toList(),
    );
  }

  void onFinishSelect(String item) {
    autoSelectItems(item); // Auto-select based on finish selection
  }

  void onCutSelect(String item) {
    setState(() {
      if (searchController.selectedCut.contains(item)) {
        searchController.selectedCut.remove(item);
      } else {
        searchController.selectedCut.add(item);
      }
    });
  }

  void onSymmetrySelect(String item) {
    setState(() {
      if (searchController.selectedSymmetry.contains(item)) {
        searchController.selectedSymmetry.remove(item);
      } else {
        searchController.selectedSymmetry.add(item);
      }
    });
  }

  void onPolishSelect(String item) {
    setState(() {
      if (searchController.selectedPolish.contains(item)) {
        searchController.selectedPolish.remove(item);
      } else {
        searchController.selectedPolish.add(item);
      }
    });
  }

  Widget customChoiceChip({
    required String label,
    required bool selected,
    required Function(bool) onSelected,
  }) {
    return GestureDetector(
      onTap: () => onSelected(!selected),
      child: Container(
        width: 55,
        height: 60,

        // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,

          // color: selected ? Colors.blue : Colors.grey[300],
          shape: BoxShape.circle,
          boxShadow: selected
              ? [
                  BoxShadow(
                      color: const Color(0xffA47842).withOpacity(0.3),
                      spreadRadius: 2,
                      offset: const Offset(0, 6),
                      blurRadius: 10)
                ]
              : [],
          border: Border.all(
              color: selected ? const Color(0xffA47842) : Colors.grey),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 14,
                color: selected ? const Color(0xffA47842) : Colors.grey),
          ),
        ),
      ),
    );
  }
}
