import 'package:diamond_app/Model/cart_model.dart';
import 'package:diamond_app/service/cart_service.dart';
import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DiamondDetailsScreen extends StatefulWidget {
  // Map<String, dynamic> itemData2;
  final CartItem itemData2;
  final bool next;
  String id;
  String Comments;
  String certiNo;
  String certificate_url;
  String certified;
  String city;
  String clarity;
  String color;
  String cut;
  String depth;
  String fluorescene;
  String image_url;
  String mesurement;
  String polish;
  String shape;
  String size;
  String sizeRange;
  String status;
  String stone_ID;
  String symm;
  String table;
  String type;
  String video_url;
  String pageName;

  DiamondDetailsScreen({
    super.key,
    // this.itemData2 = const {},
    required this.next,
    required this.certiNo,
    required this.certificate_url,
    required this.certified,
    required this.city,
    required this.clarity,
    required this.color,
    required this.Comments,
    required this.cut,
    required this.depth,
    required this.fluorescene,
    required this.id,
    required this.image_url,
    required this.mesurement,
    required this.polish,
    required this.shape,
    required this.size,
    required this.sizeRange,
    required this.status,
    required this.stone_ID,
    required this.symm,
    required this.table,
    required this.type,
    required this.video_url,
    required this.pageName,
    required this.itemData2,
  });

  @override
  State<DiamondDetailsScreen> createState() => _DiamondDetailsScreenState();
}

class _DiamondDetailsScreenState extends State<DiamondDetailsScreen>
    with TickerProviderStateMixin {
  TabController? _firstTabController;
  TabController? _secondTabController;
  late WebViewController _controller;
  bool _isLoading = true;
  String userid = '';
  int _selectedIndex = 0;

  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 3) {
      if (widget.pageName == "CartScreen") {
        final cartService = CartService();
        final cartItem = CartItem(
          id: widget.id,
          comments: widget.Comments,
          certiNo: widget.certiNo,
          certificateUrl: widget.certificate_url,
          certified: widget.certified,
          city: widget.city,
          clarity: widget.clarity,
          color: widget.color,
          cut: widget.cut,
          depth: widget.depth,
          fluorescene: widget.fluorescene,
          imageUrl: widget.image_url,
          mesurement: widget.mesurement,
          polish: widget.polish,
          shape: widget.shape,
          size: widget.size,
          sizeRange: widget.sizeRange,
          status: widget.status,
          stoneID: widget.stone_ID,
          symm: widget.symm,
          table: widget.table,
          type: widget.type,
          videoUrl: widget.video_url,
        );
        await cartService.removeFromCart(
            userid, cartItem, context, widget.shape);
      } else {
        final cartService = CartService();
        final cartItem = CartItem(
          id: widget.id,
          comments: widget.Comments,
          certiNo: widget.certiNo,
          certificateUrl: widget.certificate_url,
          certified: widget.certified,
          city: widget.city,
          clarity: widget.clarity,
          color: widget.color,
          cut: widget.cut,
          depth: widget.depth,
          fluorescene: widget.fluorescene,
          imageUrl: widget.image_url,
          mesurement: widget.mesurement,
          polish: widget.polish,
          shape: widget.shape,
          size: widget.size,
          sizeRange: widget.sizeRange,
          status: widget.status,
          stoneID: widget.stone_ID,
          symm: widget.symm,
          table: widget.table,
          type: widget.type,
          videoUrl: widget.video_url,
        );
        await cartService.addToCart(userid, cartItem, context, widget.shape);
      }
    }
  }

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
    _firstTabController = TabController(length: 3, vsync: this);
    _secondTabController = TabController(length: 2, vsync: this);
    getUser();
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
      ..loadRequest(Uri.parse(widget.video_url == ""
          ? "https://view-360.video/Video?d=C15723"
          : "${widget.video_url}"));
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
    print("widget.itemData2:=>${widget.image_url}");
    Map<String, double> result =
        extractMeasurement(widget.itemData2.mesurement);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: const Color(0xffFAFAFA),
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.percent), label: "make Offer"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: "Buy Now"),
            BottomNavigationBarItem(
                icon: Icon(Icons.front_hand_outlined), label: "Hold Now"),
            widget.pageName == "CartScreen"
                ? BottomNavigationBarItem(
                    icon: Icon(Icons.remove_shopping_cart_outlined),
                    label: "Remove Cart")
                : BottomNavigationBarItem(
                    icon: Icon(Icons.add_shopping_cart_outlined),
                    label: "Add Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Memo"),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                backOnTap: () {
                  Navigator.pop(context);
                },
                showActionButton: false,
                title: widget.itemData2!.stoneID,
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
                                  child: widget.itemData2!.imageUrl == ""
                                      ? Image.asset(
                                          "assets/images/no_image.png")
                                      : Image.network(
                                          '${widget.itemData2!.imageUrl}',
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
                          const Center(
                            child: const CircularProgressIndicator(
                              color: Color(0xffAA864E),
                            ),
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
                height: 280,
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
                                '${widget.itemData2!.cut}',
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
                                '${widget.itemData2!.color}',
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
                                '${widget.itemData2!.clarity}',
                              ),
                              const Text("SYMM:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData2!.symm}',
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
                                '${widget.itemData2!.certified}',
                              ),
                              const Text("FLS:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData2!.fluorescene}',
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
                              Text('${widget.itemData2!.city}'),
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
                                '${widget.itemData2!.table}',
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
                                '${widget.itemData2!.depth}',
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
                                  // '${widget.itemData2['crown_angle']}',
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
                                  // '${widget.itemData2['height']}',
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
                                  // '${widget.itemData2['pav_angle']}',
                                  ),
                              const Text("DEPTH:",
                                  style: TextStyle(color: Color(0xffA47842))),
                              Text(
                                '${widget.itemData2!.depth}',
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
                                  // '${widget.itemData2['pav_height']}',
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
                              "REPORT COMMENT: ${widget.itemData2!.comments}",
                            ))
                      ],
                    ),
                  ],
                ),
              ),
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
