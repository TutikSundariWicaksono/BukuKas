import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String currentPassword =
      'password'; // Ganti dengan password saat ini yang benar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Foto, Nama, dan NIM

            SizedBox(height: 24.0),
            // Form untuk mengganti password
            Text(
              'Ganti Password',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),

            TextField(
              controller: currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password Saat Ini',
              ),
            ),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password Baru',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Validasi password saat ini
                if (currentPasswordController.text == currentPassword) {
                  // Password saat ini benar
                  if (newPasswordController.text ==
                      confirmPasswordController.text) {
                    // Password baru sesuai dengan konfirmasi
                    // Simpan password baru ke database atau tempat penyimpanan yang sesuai
                    // Tampilkan pesan sukses atau lakukan tindakan yang sesuai
                    // ...
                  } else {
                    // Password baru tidak sesuai dengan konfirmasi
                    // Tampilkan pesan kesalahan
                    // ...
                  }
                } else {
                  // Password saat ini salah
                  // Tampilkan pesan kesalahan
                  // ...
                }
              },
              child: Text('Simpan Password Baru'),
            ),
            SizedBox(height: 200.0),
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pasfoto.JPG'),
                  radius: 50.0,
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'About This App',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Aplikasi ini dibuat oleh:',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      'Nama: Tutik Sundari W.',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      'NIM: 2141764047',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      'Tanggal: 29 September 2023',
                      style: TextStyle(
                        fontSize: 14.0,
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
