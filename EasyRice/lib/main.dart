import 'package:flutter/material.dart';
import 'package:mini_project_warmindo/pageHitungTakaran.dart';
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
      'gambar': 'assets/beras/berasPutih.jpeg',
    },
    {
      'jenis': 'Beras Merah',
      'gambar': 'assets/beras/berasMerah.jpeg',
    },
    {
      'jenis': 'Beras Hitam',
      'gambar': 'assets/beras/berasHitam.jpeg',
    },
    {
      'jenis': 'Beras Basmati',
      'gambar': 'assets/beras/berasBasmati.jpeg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: navbar(),
        body: Padding(
            padding: EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(8),
                  child: Text('Pilih jenis beras:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                    child: Expanded(
                        child: ListView.builder(
                  itemCount: daftarBeras.length,
                  itemBuilder: (context, index) {
                    final beras = daftarBeras[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pagehitungtakaran(beras: beras),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                width: 100,
                                height: 100,
                                beras['gambar']!,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  beras['jenis']!,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )))
              ],
            )));
  }
}
