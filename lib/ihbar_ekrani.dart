import 'dart:io'; // Image.file için gerekli
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'puan_servisi.dart'; // PuanServisi dosyanın yolu
class IhbarEkrani extends StatefulWidget {
  const IhbarEkrani({super.key});

  @override
  State<IhbarEkrani> createState() => _IhbarEkraniState();
}

class _IhbarEkraniState extends State<IhbarEkrani> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _fotografSec() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() => _image = photo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yeni İhbar")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: _fotografSec,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.green),
                ),
                child: _image == null
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo, size: 50, color: Colors.green),
                          Text("Fotoğraf Ekle")
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        // Image.network yerine cihazdaki dosyayı göstermek için File kullanıyoruz:
                        child: Image.file(File(_image!.path), fit: BoxFit.cover),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: "Sorunu Kısaca Açıkla",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Puan ekleme mantığı
                  Provider.of<PuanServisi>(context, listen: false).ihbarGonderildi();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("İhbarın alındı, 50 puan kazandın!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF27ae60),
                ),
                child: const Text("İhbarı Gönder",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}