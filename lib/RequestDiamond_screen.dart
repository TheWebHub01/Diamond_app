import 'package:flutter/material.dart';

class RequestDiamondPage extends StatefulWidget {
  @override
  _RequestDiamondPageState createState() => _RequestDiamondPageState();
}

class _RequestDiamondPageState extends State<RequestDiamondPage> {
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _submitRequest() async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Request sent!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Request Diamond')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descriptionController,
              decoration:
                  const InputDecoration(labelText: 'Request Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRequest,
              child: const Text('Submit Request'),
            ),
          ],
        ),
      ),
    );
  }
}
