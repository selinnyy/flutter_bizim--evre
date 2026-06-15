import 'package:flutter/material.dart';

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({super.key});

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  // Kullanıcının yazdıklarını tutacak kontrolcüler
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giriş Yap")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _adController,
              decoration: const InputDecoration(labelText: "Adınız", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _soyadController,
              decoration: const InputDecoration(labelText: "Soyadınız", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _sifreController,
              decoration: const InputDecoration(labelText: "Şifreniz", border: OutlineInputBorder()),
              obscureText: true,
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity, // Butonu ekran genişliğinde yap
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  // Giriş başarılı bildirimi
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Giriş Başarılı! Hoş geldin."),
                      backgroundColor: Colors.green,
                    ),
                  );
                  
                  // Burada verileri alıp işlem yapabilirsin:
                  // print(_adController.text);
                },
                child: const Text("Giriş Yap", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}