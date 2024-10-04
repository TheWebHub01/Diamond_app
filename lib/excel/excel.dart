import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

class ExcelScreen extends StatefulWidget {
  const ExcelScreen({super.key});

  @override
  State<ExcelScreen> createState() => _ExcelScreenState();
}

class _ExcelScreenState extends State<ExcelScreen> {
  Future<List<List<dynamic>>> readExcelFromAssets() async {
    // Load the Excel file from assets
    ByteData data = await rootBundle.load('assets/diamond.xlsx');
    var bytes = data.buffer.asUint8List();

    // Decode the file
    var excel = Excel.decodeBytes(bytes);

    List<List<dynamic>> rows = [];
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        // Extract the values of each cell in the row
        var rowData = row.map((cell) => cell?.value ?? '').toList();
        rows.add(rowData);
        // Print each row's values
        print("Row data: $rowData");
      }
    }
    return rows;
  }

  Future<void> uploadDataToFirestore(List<List<dynamic>> data) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    List<Map<String, dynamic>> formattedData = [];

    for (var row in data) {
      // Ensure each row's values are converted to the appropriate types (e.g., strings)
      formattedData.add({
        'id': row[0].toString(),
        'stone_ID': row[1].toString(),
        'status': row[2].toString(),
        'certified': row[3].toString(),
        'certiNo': row[4].toString(),
        'sizeRange': row[5].toString(),
        'shape': row[6].toString(),
        'size': row[7].toString(),
        'clarity': row[8].toString(),
        'color': row[9].toString(),
        'cut': row[10].toString(),
        'polish': row[11].toString(),
        'symm': row[12].toString(),
        'fluorescene': row[13].toString(),
        'type': row[14].toString(),
        'city': row[15].toString(),
        'mesurement': row[16].toString(),
        'depth': row[17].toString(),
        'table': row[18].toString(),
      });
    }

    // Upload the entire list of rows as a single document
    await firestore.collection('diamonds').doc('abc').set({
      'data': formattedData, // Store all rows under the "data" key
    });
  }

  importExcelToFirestore() async {
    List<List<dynamic>> data = await readExcelFromAssets();
    await uploadDataToFirestore(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await importExcelToFirestore();
          },
          child: const Text('Import Data'),
        ),
      ),
    );
  }
}
