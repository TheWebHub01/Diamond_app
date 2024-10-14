import 'package:diamond_app/Home/diamond_details_screen.dart';
import 'package:diamond_app/utiles/data_controller.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class NewArrivalScreen extends StatefulWidget {
  const NewArrivalScreen({super.key});

  @override
  State<NewArrivalScreen> createState() => _NewArrivalScreenState();
}

class _NewArrivalScreenState extends State<NewArrivalScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  Datacontroller datacontroller = Get.put(Datacontroller());
  bool isLoading = true;
  final List<String> sortOptions = [
    "Price Low to High",
    "Price High to Low",
    "Carat Low to High",
    "Carat High to Low",
    "Disc% Low to High",
    "Disc% High to Low",
    "Color Low to High",
    "Color High to Low",
    "Clarity Low to High",
    "Clarity High to Low",
  ];
  List<String> selectedFilters = [];

  @override
  void initState() {
    super.initState();
    datacontroller.readdata();
  }

  void _toggleFilter(String filter) {
    setState(() {
      if (selectedFilters.contains(filter)) {
        selectedFilters.remove(filter);
        isLoading = !isLoading;
      } else {
        selectedFilters.add(filter);
        isLoading = !isLoading;
      }
    });
  }

  void _applyFilters() {
    setState(() {
      datacontroller.filterDatalist = RxList.from(datacontroller.datalist);

      for (var filter in selectedFilters) {
        switch (filter) {
          case 'Price Low to High':
            datacontroller.filterDatalist
                .sort((a, b) => a['price'].compareTo(b['price']));
            break;
          case 'Price High to Low':
            datacontroller.filterDatalist
                .sort((a, b) => b['price'].compareTo(a['price']));
            break;
          case 'Carat Low to High':
            datacontroller.filterDatalist
                .sort((a, b) => a['carat'].compareTo(b['carat']));
            break;
          case 'Carat High to Low':
            datacontroller.filterDatalist
                .sort((a, b) => b['carat'].compareTo(a['carat']));
            break;
          case 'Disc% Low to High':
            datacontroller.filterDatalist
                .sort((a, b) => a['discount'].compareTo(b['discount']));
            break;
          case 'Disc% High to Low':
            datacontroller.filterDatalist
                .sort((a, b) => b['discount'].compareTo(a['discount']));
            break;
          case 'Color Low to High':
            datacontroller.filterDatalist
                .sort((a, b) => a['color'].compareTo(b['color']));
            break;
          case 'Color High to Low':
            datacontroller.filterDatalist
                .sort((a, b) => b['color'].compareTo(a['color']));
            break;
          case 'Clarity Low to High':
            datacontroller.filterDatalist
                .sort((a, b) => a['clarity'].compareTo(b['clarity']));
            break;
          case 'Clarity High to Low':
            datacontroller.filterDatalist
                .sort((a, b) => b['clarity'].compareTo(a['clarity']));
            break;
        }
      }
    });
    Navigator.of(context).pop();
  }

  void _clearFilters() {
    setState(() {
      selectedFilters.clear();
      datacontroller.filterDatalist = RxList.from(datacontroller.datalist);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sort By',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Flexible(
              child: ListView(
                children: [
                  SortOption(
                    'Price Low to High',
                    _toggleFilter,
                    selectedFilters,
                  ),
                  SortOption(
                    'Price High to Low',
                    _toggleFilter,
                    selectedFilters,
                  ),
                  SortOption(
                    'Carat Low to High',
                    _toggleFilter,
                    selectedFilters,
                  ),
                  SortOption(
                    'Carat High to Low',
                    _toggleFilter,
                    selectedFilters,
                  ),
                  SortOption(
                    'Disc% Low to High',
                    _toggleFilter,
                    selectedFilters,
                  ),
                  SortOption(
                    'Disc% High to Low',
                    _toggleFilter,
                    selectedFilters,
                  ),
                  SortOption(
                    'Color Low to High',
                    _toggleFilter,
                    selectedFilters,
                  ),
                  SortOption(
                    'Color High to Low',
                    _toggleFilter,
                    selectedFilters,
                  ),
                  SortOption(
                    'Clarity Low to High',
                    _toggleFilter,
                    selectedFilters,
                  ),
                  SortOption(
                    'Clarity High to Low',
                    _toggleFilter,
                    selectedFilters,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: _clearFilters,
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffE1E1E1)),
                      child: const Center(child: Text("Cancel")),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _applyFilters();
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffA47842),
                      ),
                      child: const Center(
                          child: Text(
                        "Done",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(
              backOnTap: () {
                Navigator.pop(context);
              },
              showActionButton: true,
              title: "New Arrival",
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
                () => (datacontroller.filterDatalist.isEmpty)
                    ? const Center(
                        child: Text(
                        "No\n New Arrival Result Found",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xff929292), fontSize: 22),
                      ))
                    : ListView.builder(
                        itemCount: datacontroller.filterDatalist.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DiamondDetailsScreen(
                                        next: false,
                                        itemData: datacontroller
                                            .filterDatalist[index]),
                                  ));
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "${datacontroller.filterDatalist[index]['stage']}"),
                                        SizedBox(
                                            height: 40,
                                            child: Image.asset(
                                                "${datacontroller.filterDatalist[index]['images']}")),
                                        Text(
                                            "${datacontroller.filterDatalist[index]['imName']}"),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "${datacontroller.filterDatalist[index]['clarity']}"),
                                        Text(
                                            "FIN : ${datacontroller.filterDatalist[index]['cut']} ${datacontroller.filterDatalist[index]['Finish']}"),
                                        Text(
                                            "FLOU : ${datacontroller.filterDatalist[index]['symmetry']}"),
                                        Text(
                                            "${datacontroller.filterDatalist[index]['location']} ${datacontroller.filterDatalist[index]['lab']}"),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "Length :${datacontroller.filterDatalist[index]['lengh']} "),
                                        Text(
                                            "Width : ${datacontroller.filterDatalist[index]['width']}"),
                                        Text(
                                            "Depth : ${datacontroller.filterDatalist[index]['depth']}"),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "${datacontroller.filterDatalist[index]['ratio']}"),
                                        Text(
                                            "${datacontroller.filterDatalist[index]['price']}"),
                                        Text(
                                            "${datacontroller.filterDatalist[index]['crown']}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SortOption extends StatefulWidget {
  final String text;
  final Function(String) onToggle;
  final List<String> selectedFilters;

  const SortOption(
    this.text,
    this.onToggle,
    this.selectedFilters,
  );

  @override
  State<SortOption> createState() => _SortOptionState();
}

class _SortOptionState extends State<SortOption> {
  bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CheckboxListTile(
        //   title: Text(text),
        //   value: selectedFilters.contains(text),
        //   onChanged: (_) => onToggle(text),
        // ),
        ListTile(
          leading: widget.selectedFilters.isNotEmpty
              ? const Icon(Icons.add)
              : const Icon(Icons.add),
          title: Text(widget.text),
          onTap: () => widget.onToggle(widget.text),
        ),
        const Divider(),
      ],
    );
  }
}
