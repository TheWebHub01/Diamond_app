import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diamond_app/Home/diamond_details_screen.dart';
import 'package:diamond_app/Model/cart_model.dart';
import 'package:diamond_app/service/cart_service.dart';
import 'package:diamond_app/utiles/search_controller.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MyDiamondScreen extends StatefulWidget {
  List<String> selectedStatus;
  List<String> selectedShape;
  List<String> selectedColor;
  List<String> selectedClarity;
  List<String> selectedCut;
  List<String> selectedPolish;
  List<String> selectedSymmetry;
  List<String> selectRange;
  List<String> selectShade;
  List<String> selectLab;
  List<String> selectCity;
  String selectdepth;
  String selectTable;
  String selectcertiNo;

  MyDiamondScreen({
    super.key,
    required this.selectedShape,
    required this.selectedStatus,
    required this.selectedColor,
    required this.selectedClarity,
    required this.selectedCut,
    required this.selectedPolish,
    required this.selectedSymmetry,
    required this.selectRange,
    required this.selectShade,
    required this.selectdepth,
    required this.selectTable,
    required this.selectLab,
    required this.selectcertiNo,
    required this.selectCity,
  });
  @override
  _MyDiamondScreenState createState() => _MyDiamondScreenState();
}

class _MyDiamondScreenState extends State<MyDiamondScreen> {
  List<CartItem> diamondlist = []; // To store the list of diamonds
  List<CartItem> filteredDiamondList = []; // To store the filtered list
  ControllerSearch searchController = Get.put(ControllerSearch());
  bool _isLoading = false;
  bool _noResultFound = false;
  int _selectedIndex = 0;
  String userid = '';

  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.getString('userid');
    print("prefs.getString('userid'):=>${prefs.getString('userid')}");
    setState(() {
      userid = prefs.getString('userid')!;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDiamonds(); // Fetch diamonds when screen loads
  }

  Future<void> fetchDiamonds() async {
    setState(() {
      _isLoading = true;
      _noResultFound = false;
    });
    try {
      // Fetch the 'data' document
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('diamonds')
          .doc('data')
          .get();

      if (doc.exists) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        if (data != null && data.containsKey('data')) {
          // Cast the dynamic list to List<CartItem> by mapping each item
          List<dynamic> diamondData = data['data'];
          List<CartItem> diamondList = diamondData.map((item) {
            return CartItem.fromMap(item as Map<String, dynamic>);
          }).toList();

          setState(() {
            diamondlist = diamondList;
            print("diamondlist=>$diamondlist");

            // Set the list of diamonds
            applyFilters(); // Apply filters to the data

            print("filteredDiamondList:=>${filteredDiamondList}");
          });
        }
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error retrieving diamonds: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }

  void applyFilters() {
    setState(() {
      filteredDiamondList = diamondlist.where((diamond) {
        // Filter by status
        final matchesStatus = widget.selectedStatus.isEmpty ||
            widget.selectedStatus.contains(diamond.status);

        // // Filter by shape
        final matchesShape = widget.selectedShape.isEmpty ||
            widget.selectedShape.contains(diamond.shape);

        // // Filter by color
        final matchesColor = widget.selectedColor.isEmpty ||
            widget.selectedColor.contains(diamond.color);

        // // Filter by clarity
        final matchesClarity = widget.selectedClarity.isEmpty ||
            widget.selectedClarity.contains(diamond.clarity);

        // // Filter by cut
        final matchesCut = widget.selectedCut.isEmpty ||
            widget.selectedCut.contains(diamond.cut);
        final matchesPolish = widget.selectedPolish.isEmpty ||
            widget.selectedPolish.contains(diamond.polish);

        final matchesSymm = widget.selectedSymmetry.isEmpty ||
            widget.selectedSymmetry.contains(diamond.symm);
        final matcheLab = widget.selectLab.isEmpty ||
            widget.selectLab.contains(diamond.certified);
        final matchesSizeRange = widget.selectRange.isEmpty ||
            widget.selectRange.contains(diamond.sizeRange);
        final matchesShades = widget.selectShade.isEmpty ||
            widget.selectShade.contains(diamond.fluorescene);
        final matchesCity = widget.selectCity.isEmpty ||
            widget.selectCity.contains(diamond.city);
        final matchesSelectCertiNo = widget.selectcertiNo.isEmpty ||
            diamond.certiNo == widget.selectcertiNo;

        // final matchesDepth = widget.selectdepth.isEmpty ||
        //     diamond['depth'].toString() == widget.selectdepth;

        // final matchesTable = widget.selectTable.isEmpty ||
        //     diamond['depth'].toString() == widget.selectTable;
        return matchesStatus &&
            matchesShape &&
            matchesColor &&
            matchesClarity &&
            matchesCut &&
            matchesSizeRange &&
            // matchesDepth &&
            // matchesTable &&
            matchesPolish &&
            matchesSymm &&
            matcheLab &&
            matchesShades &&
            matchesSelectCertiNo &&
            matchesCity;
      }).toList();
      _noResultFound = filteredDiamondList.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('hello:=>${searchController.datacontroller.txtFromT.text}');

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            backOnTap: () {
              Navigator.pop(context);
            },
            showActionButton: true,
            title: "Search Result",
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
                    Text("CTS", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("185.14"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dis%", style: TextStyle(fontWeight: FontWeight.bold)),
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
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Color(0xffAA864E),
                  ))
                : _noResultFound
                    ? const Center(
                        child: Text('No data found',
                            style: TextStyle(fontSize: 18)))
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: filteredDiamondList.length,
                        itemBuilder: (context, index) {
                          final diamond = filteredDiamondList[index];

                          print("${diamond.imageUrl}");
                          print("diamond1231:=>${diamond.comments}");
                          Map<String, String> parseMeasurement(
                              String measurement) {
                            List<String> parts = measurement.split('*');

                            String lengthRange = parts[0];
                            String width = parts[1];

                            List<String> lengthParts = lengthRange.split('-');
                            String lengthStart = lengthParts[0];
                            String lengthEnd =
                                lengthParts.length > 1 ? lengthParts[1] : "";

                            return {
                              "lengthStart": lengthStart,
                              "lengthEnd": lengthEnd,
                              "width": width
                            };
                          }

                          Map<String, String> result =
                              parseMeasurement(diamond.mesurement);
                          String firstCharacter =
                              diamond.status.substring(0, 1);

                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                DiamondDetailsScreen(
                                  pageName: "DiamondListScreen",
                                  next: false,
                                  itemData2: diamond,
                                  Comments: diamond.comments,
                                  certiNo: diamond.certiNo,
                                  certificate_url: diamond.certificateUrl,
                                  certified: diamond.certified,
                                  city: diamond.city,
                                  clarity: diamond.clarity,
                                  color: diamond.color,
                                  cut: diamond.cut,
                                  depth: diamond.depth,
                                  fluorescene: diamond.fluorescene,
                                  id: diamond.id,
                                  image_url: diamond.imageUrl,
                                  mesurement: diamond.mesurement,
                                  polish: diamond.polish,
                                  shape: diamond.shape,
                                  size: diamond.size,
                                  sizeRange: diamond.sizeRange,
                                  status: diamond.status,
                                  stone_ID: diamond.stoneID,
                                  symm: diamond.symm,
                                  table: diamond.table,
                                  type: diamond.type,
                                  video_url: diamond.videoUrl,
                                ),
                              );
                            },
                            child: Container(
                              color: const Color(0xffA47842).withOpacity(0.2),
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("${diamond.stoneID}"),
                                      diamond.imageUrl == ""
                                          ? Image.asset(
                                              "assets/images/no_image.png",
                                              height: 45,
                                              width: 45,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              "${diamond.imageUrl}",
                                              height: 45,
                                              width: 45,
                                            ),
                                      Text("${diamond.shape}"),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${diamond.size}"),
                                          const SizedBox(width: 5),
                                          Text("${diamond.color}"),
                                          const SizedBox(width: 5),
                                          Text("${diamond.clarity}"),
                                        ],
                                      ),
                                      Text(
                                          "FIN: ${diamond.cut}  ${diamond.symm}"),
                                      Text("FLOU: ${diamond.fluorescene}"),
                                      Row(
                                        children: [
                                          Text("${diamond.city}"),
                                          const SizedBox(width: 10),
                                          Text("${diamond.certified}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Length: ${result['lengthStart']}"),
                                      Text("width: ${result['width']}"),
                                      Text("Depth: ${diamond.depth}"),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text("-99.51%"),
                                      const Text("264.60\$ ICt"),
                                      const Text("\$1.562.89"),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red),
                                        child: Center(
                                          child: Text(
                                            firstCharacter,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
