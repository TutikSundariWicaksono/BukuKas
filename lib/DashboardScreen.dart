import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'AddIncomeScreen.dart';
import 'AddExpenseScreen.dart';
import 'DetailCashFlow.dart';
import 'SettingScreen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double expenses = 0.0;
  double incomes = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikonya bisa diganti sesuai keinginan
          onPressed: () {
            // Navigasi ke halaman LoginScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Label Total Pengeluaran
            Center(
              child: Text(
                'Rangkuman Bulan Ini',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                'Total Pengeluaran: Rp. ${expenses.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            SizedBox(height: 16.0),

            // Label Total Pemasukan
            Center(
              child: Text(
                'Total Pemasukan: Rp. ${incomes.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            SizedBox(height: 32.0),

            Container(
              height: 100.0, // Sesuaikan tinggi grafik sesuai kebutuhan
              color: Colors
                  .blueGrey, // Ganti dengan warna atau gambar sesuai kebutuhan
              // ... Anda dapat menambahkan kode untuk grafik di sini ...
            ),

            SizedBox(height: 20.0),

            // Tombol Navigasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddIncomeScreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255,
                              255), // Ganti warna latar belakang sesuai keinginan
                          borderRadius: BorderRadius.circular(
                              10.0), // Sesuaikan dengan kebutuhan
                        ),
                        padding:
                            EdgeInsets.all(10.0), // Sesuaikan dengan kebutuhan
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/income.jpeg', // Ganti dengan path gambar Anda
                              width:
                                  50, // Sesuaikan lebar gambar sesuai kebutuhan
                              height:
                                  50, // Sesuaikan tinggi gambar sesuai kebutuhan
                            ),
                            SizedBox(
                                height:
                                    10.0), // Sesuaikan dengan jarak yang diinginkan
                            Text(
                              'Tambah Pemasukan',
                              style: TextStyle(
                                color: Colors
                                    .black, // Ganti warna teks sesuai keinginan
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddExpenseScreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255,
                              255), // Ganti warna latar belakang sesuai keinginan
                          borderRadius: BorderRadius.circular(
                              10.0), // Sesuaikan dengan kebutuhan
                        ),
                        padding:
                            EdgeInsets.all(10.0), // Sesuaikan dengan kebutuhan
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/expense.jpeg', // Ganti dengan path gambar Anda
                              width:
                                  50, // Sesuaikan lebar gambar sesuai kebutuhan
                              height:
                                  50, // Sesuaikan tinggi gambar sesuai kebutuhan
                            ),
                            SizedBox(
                                height:
                                    10.0), // Sesuaikan dengan jarak yang diinginkan
                            Text(
                              'Tambah Pengeluaran',
                              style: TextStyle(
                                color: Colors
                                    .black, // Ganti warna teks sesuai keinginan
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        // Data pemasukan dan pengeluaran (contoh data)
                        List<Map<String, dynamic>> cashFlowData = [
                          {
                            'type': 'income',
                            'description': 'Pemasukan 1',
                            'amount': 100000
                          },
                          {
                            'type': 'expense',
                            'description': 'Pengeluaran 1',
                            'amount': 50000
                          },

                          // Tambahkan data lain sesuai kebutuhan
                        ];

                        // Navigasi ke halaman Detail Cash Flow dengan data yang disediakan
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailCashFlow(cashFlowData: cashFlowData),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255,
                              255), // Ganti warna latar belakang sesuai keinginan
                          borderRadius: BorderRadius.circular(
                              10.0), // Sesuaikan dengan kebutuhan
                        ),
                        padding:
                            EdgeInsets.all(10.0), // Sesuaikan dengan kebutuhan
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/cashflow.jpeg', // Ganti dengan path gambar Anda
                              width:
                                  50, // Sesuaikan lebar gambar sesuai kebutuhan
                              height:
                                  50, // Sesuaikan tinggi gambar sesuai kebutuhan
                            ),
                            SizedBox(
                              height:
                                  10.0, // Sesuaikan dengan jarak yang diinginkan
                            ),
                            Text(
                              'Detail Cash Flow',
                              style: TextStyle(
                                color: Colors
                                    .black, // Ganti warna teks sesuai keinginan
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingScreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255,
                              255), // Ganti warna latar belakang sesuai keinginan
                          borderRadius: BorderRadius.circular(
                              10.0), // Sesuaikan dengan kebutuhan
                        ),
                        padding:
                            EdgeInsets.all(10.0), // Sesuaikan dengan kebutuhan
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/setting.png', // Ganti dengan path gambar Anda
                              width:
                                  50, // Sesuaikan lebar gambar sesuai kebutuhan
                              height:
                                  50, // Sesuaikan tinggi gambar sesuai kebutuhan
                            ),
                            SizedBox(
                                height:
                                    10.0), // Sesuaikan dengan jarak yang diinginkan
                            Text(
                              'Setting',
                              style: TextStyle(
                                color: Colors
                                    .black, // Ganti warna teks sesuai keinginan
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
