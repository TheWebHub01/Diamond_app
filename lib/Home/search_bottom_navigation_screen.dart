import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:diamond_app/Home/searche_screen.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

class SearchBottomNavigationScreen extends StatefulWidget {
  const SearchBottomNavigationScreen({super.key});

  @override
  State<SearchBottomNavigationScreen> createState() =>
      _SearchBottomNavigationScreenState();
}

class _SearchBottomNavigationScreenState
    extends State<SearchBottomNavigationScreen> {
  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: DarwinInitializationSettings(),
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        if (notificationResponse.payload != null) {
          debugPrint('Notification payload: ${notificationResponse.payload}');
        }
      },
    );
  }

  int _selectedIndex = 0;
  TextEditingController txtName = TextEditingController();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      _showAlertDialog(context, 1);
    }
    if (index == 2) {
      _showAlertDialog(context, 2);
    }
  }

  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Diamond Demand',
      txtName.text,
      platformChannelSpecifics,
      payload: 'simple_notification_payload',
    );
    Navigator.pop(context);
  }

  void _showAlertDialog(BuildContext context, int? index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                index == 1 ? "Save Demand" : "Save Search",
                style: const TextStyle(fontSize: 25),
              ),
              const Text(
                " Are you sure save this result?",
                style: TextStyle(color: Colors.grey),
              ),
              TextField(
                controller: txtName,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey)),
                  hintText: "Enter Name",
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffE1E1E1)),
                      child: const Center(
                        child: Text("Cancel"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _showNotification,
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffA47842),
                      ),
                      child: const Center(
                          child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  final List<Widget> _screens = [
    const SearchScreen(),
    const SearchScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        backgroundColor: const Color(0xffFAFAFA),
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: "Refresh"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_rounded), label: "Save Demand"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Save Search"),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
