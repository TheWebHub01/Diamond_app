import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SpicalDiamondDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> itemData;
  bool next;

  SpicalDiamondDetailsScreen(
      {super.key, required this.itemData, required this.next});

  @override
  State<SpicalDiamondDetailsScreen> createState() =>
      _SpicalDiamondDetailsScreenState();
}

class _SpicalDiamondDetailsScreenState extends State<SpicalDiamondDetailsScreen>
    with TickerProviderStateMixin {
  TabController? _firstTabController;

  TabController? _secondTabController;

  @override
  void initState() {
    super.initState();
    _firstTabController = TabController(length: 3, vsync: this);
    _secondTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _firstTabController!.dispose();
    _secondTabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              backOnTap: () {
                Navigator.pop(context);
              },
              showActionButton: false,
              title: widget.next == true
                  ? "Special Diamond Details"
                  : "Exclusive Stone Details",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  controller: _firstTabController,
                  dividerHeight: 0,
                  padding: const EdgeInsets.all(10),
                  indicator: BoxDecoration(
                    color: const Color(0xffA47842),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelPadding: const EdgeInsets.only(left: 5),
                  dividerColor: Colors.white,
                  unselectedLabelColor: Colors.grey.shade500,
                  labelColor: Colors.white,
                  indicatorColor: Colors.brown,
                  tabs: const [
                    Center(child: Text("Image", textAlign: TextAlign.center)),
                    Center(child: Text("Video", textAlign: TextAlign.center)),
                    Center(child: Text("Certi", textAlign: TextAlign.center)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: TabBarView(
                controller: _firstTabController,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 180,
                            color: Colors.grey.shade100,
                          ),
                          Center(
                            child: SizedBox(
                              height: 180,
                              width: 240,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  '${widget.itemData['imageUrl']}',
                                  // height: 100,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 180,
                            color: Colors.grey.shade100,
                          ),
                          Center(
                            child: SizedBox(
                              height: 180,
                              width: 240,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  '${widget.itemData['imageUrl']}',
                                  // height: 100,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 180,
                            color: Colors.grey.shade100,
                          ),
                          Center(
                            child: SizedBox(
                              height: 180,
                              width: 240,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  '${widget.itemData['imageUrl']}',
                                  // height: 100,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xffA47842),
              height: 50,
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "RAP",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "\$ 40500",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "DIS",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "-98.76",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$/CTS",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "\$ 502.20",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AMT",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "\$ 4066.58",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                controller: _secondTabController,
                dividerHeight: 0,
                padding: const EdgeInsets.all(10),
                unselectedLabelColor: Colors.grey.shade500,
                labelColor: Colors.black54,
                indicatorColor: Colors.black54,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Center(
                      child:
                          Text("DIAMOND DETAILS", textAlign: TextAlign.center)),
                  Center(
                      child: Text("MEASUREMENT", textAlign: TextAlign.center)),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: TabBarView(
                controller: _secondTabController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "SHAPE:",
                              style: TextStyle(color: Color(0xffA47842)),
                            ),
                            Text(
                              '${widget.itemData['shape']}',
                            ),
                            const Text("PKT NO:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text("${widget.itemData['id']}"),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Colors.grey.shade300,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("SIZE:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text("12.08"),
                            Text("CUT:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              'EX',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("COLOR:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              'D',
                            ),
                            Text("POLISH:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text("EX"),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Colors.grey.shade300,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("CLARITY:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              'IF',
                            ),
                            Text("SYMM:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              'EX',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("LAB:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              'IGI',
                            ),
                            Text("FLS:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text("NON"),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Colors.grey.shade300,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("LOCATION",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text('Surat'),
                            Text("REPORT:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text("639427111"),
                          ],
                        ),
                      ),
                      const Text("KEY TO SYMBOLS:-",
                          style: TextStyle(color: Color(0xffA47842)))
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("TABLE:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              '11.22',
                            ),
                            Text("GIRDLE:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text("Medium To\nSlightly Thick"),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Colors.grey.shade300,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("DEPTH:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              '12.22',
                            ),
                            Text("RATIO:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              '22.55',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("CR ANGLE:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              '523.22',
                            ),
                            Text("LENGTH:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              '121.00',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Colors.grey.shade300,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("CR HEIGHT",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              '124.25',
                            ),
                            Text("WIDTH:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              '51.00',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("PAV ANGLE",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              '125.20',
                            ),
                            Text("DEPTH:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              '142.22',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Colors.grey.shade300,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("PAV HEIGHT:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text(
                              '12.22',
                            ),
                            Text("CULET:",
                                style: TextStyle(color: Color(0xffA47842))),
                            Text("-"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            "REPORT COMMENT: This Laboratory Grown Diamond was created by chemical Vapor Deposition(CVD) growth process. Type lla",
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
