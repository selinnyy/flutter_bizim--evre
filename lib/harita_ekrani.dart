import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HaritaEkrani extends StatefulWidget {
  const HaritaEkrani({super.key});

  @override
  State<HaritaEkrani> createState() => _HaritaEkraniState();
}

class _HaritaEkraniState extends State<HaritaEkrani> {
  // Samsun'un koordinatları
  static const LatLng _samsunKonum = LatLng(41.2868, 36.3300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Çevre İhbar Haritası"),
        backgroundColor: Colors.green,
      ),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _samsunKonum,
          zoom: 12,
        ),
        myLocationEnabled: true, // Kullanıcının konumunu göster
      ),
    );
  }
}