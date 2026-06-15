import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ana_ekran.dart';
import 'puan_servisi.dart'; // Dosya yolunun doğru olduğundan emin ol

void main() {
  runApp(
    // Puan yönetimi için Provider'ı en tepeye yerleştiriyoruz
    ChangeNotifierProvider(
      create: (context) => PuanServisi(),
      child: const BizimCevreApp(),
    ),
  );
}

class BizimCevreApp extends StatelessWidget {
  const BizimCevreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bizim Çevre',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF27ae60),
          primary: const Color(0xFF27ae60),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        useMaterial3: true,
      ),
      home: const AnaEkran(),
    );
  }
}