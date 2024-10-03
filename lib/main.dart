import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:diamond_app/Register/splash_screen.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) => MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}

/// Notification
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Local Notifications',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: NotificationPage(),
//     );
//   }
// }
//
// class NotificationPage extends StatefulWidget {
//   @override
//   _NotificationPageState createState() => _NotificationPageState();
// }
//
// class _NotificationPageState extends State<NotificationPage> {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//   @override
//   void initState() {
//     super.initState();
//
//     tz.initializeTimeZones();
//
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: DarwinInitializationSettings(),
//     );
//
//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) {
//         if (notificationResponse.payload != null) {
//           debugPrint('Notification payload: ${notificationResponse.payload}');
//         }
//       },
//     );
//   }
//
//   Future<void> _showNotification() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Simple Notification',
//       'This is a simple notification',
//       platformChannelSpecifics,
//       payload: 'simple_notification_payload',
//     );
//   }
//
//   Future<void> _scheduleNotification() async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       5,
//       'Scheduled Notification',
//       'This is a scheduled notification',
//       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'your_channel_id',
//           'your_channel_name',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Local Notifications'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _showNotification,
//               child: Text('Show Notification'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _scheduleNotification,
//               child: Text('Schedule Notification in 5 seconds'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///sheet
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(DiamondApp());
// }
//
// class DiamondApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Diamond App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<String> _selectedRanges = [];
//
//   void _showRangeSelectionBottomSheet() async {
//     List<String>? selectedRanges = await showModalBottomSheet<List<String>>(
//       context: context,
//       builder: (BuildContext context) {
//         List<String> ranges = [
//           'Select All',
//           '0.01-0.29',
//           '0.30-0.39',
//           '0.40-0.49',
//           '0.50-0.59',
//           '0.60-0.69',
//           '0.70-0.79',
//           '0.80-0.89',
//           '0.90-0.99',
//           '1.00-1.10',
//           '1.11-1.49',
//           '1.50-1.60',
//           '1.61-1.99',
//           '2.00-2.10',
//           '2.11-2.49',
//           '2.50-2.60',
//           '2.61-2.99',
//           '3.00-3.10',
//           '3.11-3.49',
//           '3.50-3.60',
//           '3.61-3.99',
//           '4.00-4.99',
//           '5.00-5.99',
//           '6.00-9.99',
//           '10.00-20.00',
//         ];
//         List<String> selectedRanges = [];
//
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Select Ranges',
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Wrap(
//                     spacing: 8.0,
//                     runSpacing: 10,
//                     children: ranges.map((String range) {
//                       return ChoiceChip(
//                         label: Text(range),
//                         showCheckmark: false,
//                         selected: selectedRanges.contains(range),
//                         onSelected: (bool selected) {
//                           setState(() {
//                             if (selected) {
//                               selectedRanges.add(range);
//                             } else {
//                               selectedRanges.remove(range);
//                             }
//                           });
//                         },
//                       );
//                     }).toList(),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context, selectedRanges);
//                         },
//                         child: const Text('clear'),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context, selectedRanges);
//                         },
//                         child: const Text('Apply'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//
//     if (selectedRanges != null) {
//       setState(() {
//         _selectedRanges = selectedRanges;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Diamond App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               'Selected Ranges:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8.0,
//               children: _selectedRanges.map((String range) {
//                 return Text(
//                   range,
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _showRangeSelectionBottomSheet,
//                 child: const Text('Select Ranges'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
