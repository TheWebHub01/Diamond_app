import 'package:diamond_app/Home/daimondList_screen.dart';
import 'package:diamond_app/Home/demand_screen.dart';
import 'package:diamond_app/Home/search_screen.dart';
import 'package:diamond_app/Home/select_shape_screen.dart';
import 'package:diamond_app/progress_loader/progress_loader.dart';
import 'package:diamond_app/utiles/database_helper.dart';
import 'package:diamond_app/utiles/search_controller.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchedScreen extends StatefulWidget {
  const SearchedScreen({super.key});

  @override
  State<SearchedScreen> createState() => _SearchedScreenState();
}

class _SearchedScreenState extends State<SearchedScreen> {
  ControllerSearch searchController = Get.put(ControllerSearch());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DbHelper.helper.initDB();
  }

  Future<void> _performSearch() async {
    setState(() {});
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyDiamondScreen(
          selectedShape: searchController.selectedShapes,
          selectedStatus: searchController.isStageSelectedList,
          selectedColor: searchController.selectedColors,
          selectedClarity: searchController.selectedclarities,
          selectedCut: searchController.selectedCut,
          selectRange: searchController.temporarySelectedRanges,
          selectdepth:
              '${searchController.datacontroller.txtFromD.text}.${searchController.datacontroller.txtToD.text}',
          selectedPolish: searchController.selectedPolish,
          selectedSymmetry: searchController.selectedSymmetry,
          selectLab: searchController.selectedLabs,
        ),
      ),
    );
    // print("searchController.averageValue==>${searchController.averageValue}");
  }

  @override
  Widget build(BuildContext context) {
    ProgressLoader pl = ProgressLoader(context, isDismissible: true);

    // print("searchController.averageValue==>${searchController.averageValue}");
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
            pl.show();
            await _performSearch();
            pl.hide();
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
                const Expanded(
                  child: TabBarView(
                    children: [
                      SearchScreen(),
                      SavedScreen(),
                      DemandScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
