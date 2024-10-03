import 'package:diamond_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HoldItemD {
  final String name;
  final String imageUrl;
  final String holdDate;
  final String carat;
  final String clarity;
  final String color;
  final String price;

  HoldItemD({
    required this.name,
    required this.imageUrl,
    required this.holdDate,
    required this.carat,
    required this.clarity,
    required this.color,
    required this.price,
  });
}

class HoldListDetailsScreen extends StatelessWidget {
  final HoldItemD holdItem;

  const HoldListDetailsScreen({super.key, required this.holdItem});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                backOnTap: () {
                  Navigator.pop(context);
                },
                showActionButton: false,
                title: "Hold List",
              ),
              Center(
                child: Image.network(
                  holdItem.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                holdItem.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Carat: ${holdItem.carat}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Clarity: ${holdItem.clarity}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Color: ${holdItem.color}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Hold Date: ${holdItem.holdDate}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                'Price: ${holdItem.price}',
                style: const TextStyle(fontSize: 20, color: Colors.green),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
