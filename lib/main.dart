import 'package:flutter/material.dart';
import 'LoginScreen.dart'; // Pastikan impor ini mengarah ke file yang benar
import 'DashboardScreen.dart';
import 'AddIncomeScreen.dart';
import 'AddExpenseScreen.dart';
import 'database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Gunakan LoginScreen sebagai tampilan utama
    );
  }
}
