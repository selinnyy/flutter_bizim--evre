import 'package:flutter/material.dart';

class PuanServisi extends ChangeNotifier {
  int _toplamPuan = 0;
  int get toplamPuan => _toplamPuan;

  void ihbarGonderildi() {
    _toplamPuan += 50; // Her ihbar 50 puan kazandırır
    notifyListeners(); // Arayüzü günceller
  }
}