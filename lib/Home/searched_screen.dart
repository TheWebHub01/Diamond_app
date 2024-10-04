import 'package:diamond_app/Home/demand_screen.dart';
import 'package:diamond_app/Home/search_screen.dart';
import 'package:diamond_app/Home/select_shape_screen.dart';
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

                const Expanded(
                  child: TabBarView(
                    children: [SearchScreen(), SavedScreen(), DemandScreen()],
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
