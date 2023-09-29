import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'DashboardScreen.dart';
import 'database_helper.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime(2021, 1, 1);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2021, 1, 1),
      maxTime: DateTime.now(),
      onConfirm: (date) {
        setState(() {
          selectedDate = date;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Pengeluaran'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jumlah Pengeluaran',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan jumlah pengeluaran';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.date_range),
                    SizedBox(width: 8.0),
                    Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Keterangan (Opsional)',
                ),
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      // Mendapatkan nilai dari controller dan data pemasukan
                      double amount =
                          double.tryParse(amountController.text) ?? 0.0;
                      String description = descriptionController.text;
                      DateTime date = selectedDate;

                      // Membuat objek pemasukan
                      Map<String, dynamic> income = {
                        'date': date.toIso8601String(),
                        'amount': amount,
                        'description': description,
                      };

                      // Memanggil metode insertIncome untuk menyimpan data pemasukan ke database

                      // Kembali ke halaman sebelumnya (misalnya DashboardScreen)
                      Navigator.pop(context);
                    },
                    child: Text('Simpan'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        amountController.clear();
                        descriptionController.clear();
                        selectedDate = DateTime(2021, 1, 1);
                      });
                    },
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveIncome() async {
    Map<String, dynamic> incomeData = {
      'date': selectedDate.toIso8601String(),
      'amount': double.parse(amountController.text),
      'description': descriptionController.text,
    };

    // Kembali ke halaman "Beranda" atau lakukan tindakan lain yang sesuai.
    // Misalnya:
  }
}
