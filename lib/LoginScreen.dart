import 'package:flutter/material.dart';
import 'DashboardScreen.dart'; // Pastikan mengimpor file DashboardScreen.dart jika belum

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    // Ganti dengan logika autentikasi yang sesuai di sini
    String username = usernameController.text;
    String password = passwordController.text;

    // Contoh logika autentikasi sederhana
    if (username == 'user' && password == 'password') {
      // Login berhasil, arahkan ke halaman dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      // Login gagal, tampilkan pesan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login gagal. Coba lagi.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buku Kas Nusantara'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logokas.jpg', // Ganti dengan path gambar Anda
              width: 200.0, // Lebar gambar
              height: 200.0, // Tinggi gambar
            ),
            SizedBox(height: 16.0),
            Text(
              "PT. Buku Kas Nusantara",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
