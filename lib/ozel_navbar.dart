import 'package:flutter/material.dart';
import 'giris_ekrani.dart';
import 'iletisim_ekrani.dart';
import 'ana_ekran.dart';

class OzelNavbar extends StatelessWidget implements PreferredSizeWidget {
  const OzelNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          const Text("Bizim Çevre", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AnaEkran()));
            }, 
            child: const Text("Ana Sayfa", style: TextStyle(color: Colors.black))
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const IletisimEkrani()));
            }, 
            child: const Text("İletişim", style: TextStyle(color: Colors.black))
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const GirisEkrani()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text("Giriş Yap", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}