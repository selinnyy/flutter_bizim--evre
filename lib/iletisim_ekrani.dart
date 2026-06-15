import 'package:flutter/material.dart';

class IletisimEkrani extends StatelessWidget {
  const IletisimEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("İletişim")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Bize Ulaşın", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.email, color: Colors.green),
              title: Text("E-posta"),
              subtitle: Text("destek@bizimcevre.com"),
            ),
            const ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text("Telefon"),
              subtitle: Text("+90 555 000 00 00"),
            ),
            const ListTile(
              leading: Icon(Icons.location_on, color: Colors.green),
              title: Text("Adres"),
              subtitle: Text("Samsun, Türkiye"),
            ),
          ],
        ),
      ),
    );
  }
}