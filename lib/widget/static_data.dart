import 'package:diamond_app/utiles/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StaticData extends StatelessWidget {
  StaticData({super.key});
  ControllerSearch searchController = Get.put(ControllerSearch());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: searchController.datacontroller.txtpfrom,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: searchController.datacontroller.txtpto,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Table%",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: searchController.datacontroller.txtFromT,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: searchController.datacontroller.txtToT,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Depth%",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: searchController.datacontroller.txtFromD,
                decoration: InputDecoration(
                  labelText: "From",
                  labelStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: searchController.datacontroller.txtToD,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: "To",
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Lengh",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: searchController.datacontroller.txtFromL,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: searchController.datacontroller.txtToL,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Width",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: searchController.datacontroller.txtFromW,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              controller: searchController.datacontroller.txtToW,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Ratio",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: searchController.datacontroller.txtFromR,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: searchController.datacontroller.txtToR,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Crown",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: searchController.datacontroller.txtFromC,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: searchController.datacontroller.txtToC,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Height",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: searchController.datacontroller.txtFromH,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              controller: searchController.datacontroller.txtToH,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Crown Angle",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: searchController.datacontroller.txtFromCA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              controller: searchController.datacontroller.txtToCA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Pav Depth",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: searchController.datacontroller.txtFromPD,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              controller: searchController.datacontroller.txtToPD,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
        SizedBox(height: 1.h),
        const Text(
          "Pav Angle",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: searchController.datacontroller.txtFromPA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "From",
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
              controller: searchController.datacontroller.txtToPA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "To",
                labelStyle: const TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ))
          ],
        ),
      ],
    );
  }
}
