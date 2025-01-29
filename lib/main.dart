import 'package:flutter/material.dart';
import 'menu.dart';
import 'navbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

final List<Map<String, String>> daftarBeras = [
    {
      'jenis': 'Beras Putih',
      'gambar': 'beras/berasPutih.jpeg',
    },
    {
      'jenis': 'Beras Merah',
      'gambar': 'beras/berasMerah.jpeg',
    },
    {
      'jenis': 'Beras Hitam',
      'gambar': 'beras/berasHitam.jpeg',
    },
    {
      'jenis': 'Beras Basmati',
      'gambar': 'beras/berasBasmati.jpeg',
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navbar(),
      body: Padding(padding: EdgeInsets.all(13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Text('Pilih jenis beras:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            child: 
            Expanded(child: ListView.builder(
              itemCount: daftarBeras.length,
              itemBuilder: (context, index) {
                final beras=daftarBeras[index];
                return InkWell(
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          beras['gambar']!,
                          width:100,
                          height: 100,

                        )
                      ],
                    ),
                  ),
                );
              },))
          )
        ],

      )
      )
    );
  }
}
