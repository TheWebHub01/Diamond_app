import 'package:diamond_app/widget/bottom_navigation.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DiamondDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> itemData;
  final bool next;

  const DiamondDetailsScreen(
      {super.key, required this.itemData, required this.next});

  @override
  State<DiamondDetailsScreen> createState() => _DiamondDetailsScreenState();
}

class _DiamondDetailsScreenState extends State<DiamondDetailsScreen>
    with TickerProviderStateMixin {
  TabController? _firstTabController;
  TabController? _secondTabController;
  late WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _firstTabController = TabController(length: 3, vsync: this);
    _secondTabController = TabController(length: 2, vsync: this);

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) 
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true; 
            });
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false; 
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.itemData['video_url'] == ""
          ? "https://view-360.video/Video?d=C15723"
          : "${widget.itemData['video_url']}"));
  }

  @override
  void dispose() {
    _firstTabController!.dispose();
    _secondTabController!.dispose();
    _controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> result =
        extractMeasurement(widget.itemData['mesurement']);
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
                    ? "Upcomming Details"
                    : "New Arrival Details",
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
                  physics: const NeverScrollableScrollPhysics(),
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
                                  child: widget.itemData['image_url'] == ""
                                      ? Image.asset(
                                          "assets/images/no_image.png")
                                      : Image.network(
                                          '${widget.itemData['image_url']}',
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        WebViewWidget(
                          controller: _controller,
                        ),
                        if (_isLoading)
                          Center(
                            child: CircularProgressIndicator(),
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
                            const Center(
                              child: SizedBox(
                                height: 180,
                                width: 240,
                                child: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/certificate.jpg'),
                                    fit: BoxFit.cover,
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
                        child: Text("DIAMOND DETAILS",
                            textAlign: TextAlign.center)),
                    Center(
                        child:
                            Text("MEASUREMENT", textAlign: TextAlign.center)),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _secondTabController,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          color: Colors.grey.shade300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("SIZE:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              const Text("12.08"),
                              const Text("CUT:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData['cut']}',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("COLOR:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData['color']}',
                              ),
                              const Text("POLISH:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              const Text("EX"),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          color: Colors.grey.shade300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("CLARITY:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData['clarity']}',
                              ),
                              const Text("SYMM:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData['symm']}',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("LAB:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData['certified']}',
                              ),
                              const Text("FLS:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData['fluorescene']}',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          color: Colors.grey.shade300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("LOCATION",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text('${widget.itemData['city']}'),
                              const Text("REPORT:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              const Text("639427111"),
                            ],
                          ),
                        ),
                        const Text("KEY TO SYMBOLS:-",
                            style: TextStyle(color: Color(0xffA47842)))
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("TABLE:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData['table']}',
                              ),
                              const Text("GIRDLE:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              const Text("Medium To\nSlightly Thick"),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          color: Colors.grey.shade300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("DEPTH:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData['depth']}',
                              ),
                              const Text("RATIO:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                result['ratio']!.toStringAsFixed(2),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("CR ANGLE:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              const Text('3.000'
                                  // '${widget.itemData['crown_angle']}',
                                  ),
                              const Text("LENGTH:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                result['length']!.toStringAsFixed(2),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          color: Colors.grey.shade300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("CR HEIGHT",
                                  style: TextStyle(color: Color(0xffA47842))),
                              const Text('5.000'
                                  // '${widget.itemData['height']}',
                                  ),
                              const Text("WIDTH:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                result['width']!.toStringAsFixed(2),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("PAV ANGLE",
                                  style: TextStyle(color: Color(0xffA47842))),
                              const Text('4.000'
                                  // '${widget.itemData['pav_angle']}',
                                  ),
                              const Text("DEPTH:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData['depth']}',
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
                              Text('5.000'
                                  // '${widget.itemData['pav_height']}',
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
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "REPORT COMMENT: ${widget.itemData['Comments']}",
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              // BottamnavBar(
              //   screens: [],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, double> extractMeasurement(String measurement) {
    List<String> parts = measurement.split(RegExp(r'[-*]'));

    Map<String, double> result = {};

    if (parts.length == 3) {
      double lengthStart = double.parse(parts[0]);
      double lengthEnd = double.parse(parts[1]);
      double width = double.parse(parts[2]);

      double length = (lengthStart + lengthEnd) / 2;

      double ratio = length / width;

      result['length'] = length;
      result['width'] = width;
      result['ratio'] = ratio;
    } else {
      print("Invalid measurement format");
    }

    return result;
  }
}
