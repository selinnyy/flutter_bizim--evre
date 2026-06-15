import 'package:flutter/material.dart';
import 'ozel_navbar.dart';
import 'ihbar_ekrani.dart';  // Bu dosyanın var olduğundan emin ol
import 'harita_ekrani.dart'; // Bu dosyanın var olduğundan emin ol

class AnaEkran extends StatelessWidget {
  const AnaEkran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OzelNavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Hero Section (Karşılama Alanı)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              decoration: const BoxDecoration(color: Colors.green),
              child: const Column(
                children: [
                  Text("Bizim Çevre", style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Sokaklarını Güzelleştir, Şehrini Değiştir.", style: TextStyle(color: Colors.white70, fontSize: 20)),
                ],
              ),
            ),
            
            // 2. Özellik Kartları (Grid Yapısı)
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.5,
                children: [
                  _proKart(Icons.camera_alt, "Hızlı Bildirim", "Fotoğraf çek, kirliliği bildir.", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const IhbarEkrani()));
                  }),
                  _proKart(Icons.map, "Şeffaf Takip", "Harita üzerinden izle.", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HaritaEkrani()));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Özel Tasarımlı Kart Yapısı
  Widget _proKart(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.green),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}