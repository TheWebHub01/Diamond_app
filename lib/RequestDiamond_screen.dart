import 'package:flutter/material.dart';

class RequestDiamondPage extends StatefulWidget {
  @override
  _RequestDiamondPageState createState() => _RequestDiamondPageState();
}

class _RequestDiamondPageState extends State<RequestDiamondPage> {
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _submitRequest() async {
    final description = _descriptionController.text;
    // Send request to backend
    // Example: await sendRequestToBackend(description);

    // Notify user
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Request sent!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Request Diamond')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Request Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRequest,
              child: Text('Submit Request'),
            ),
          ],
        ),
      ),
    );
  }
}
