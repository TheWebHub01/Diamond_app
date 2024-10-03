import 'package:diamond_app/Home/special_diamond_details_screen.dart';
import 'package:diamond_app/utiles/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialDiamond extends StatefulWidget {
  const SpecialDiamond({super.key});

  @override
  State<SpecialDiamond> createState() => _SpecialDiamondState();
}

class _SpecialDiamondState extends State<SpecialDiamond> {
  Datacontroller datacontroller = Get.put(Datacontroller());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpicalDiamondDetailsScreen(
                      itemData: datacontroller.diamonds[index],
                      next: true,
                    ),
                  ));
            },
            child: Container(
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xffDCDCDC),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                          "${datacontroller.diamonds[index]['imageUrl']}"),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${datacontroller.diamonds[index]['shape']}",
                          style: const TextStyle(color: Color(0xff555555)),
                        ),
                        Row(
                          children: [
                            Text(
                              "${datacontroller.diamonds[index]['id']}",
                              style: const TextStyle(color: Color(0xff555555)),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "${datacontroller.diamonds[index]['size']}",
                              style: const TextStyle(color: Color(0xff555555)),
                            ),
                          ],
                        ),
                        Text(
                          "${datacontroller.diamonds[index]['igi']}",
                          style: const TextStyle(color: Color(0xff555555)),
                        ),
                        const SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: datacontroller.diamonds.length,
    );
  }
}
