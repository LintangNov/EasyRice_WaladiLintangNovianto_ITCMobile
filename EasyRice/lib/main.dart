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
      'deskripsi': 'Beras yang paling umum dan sering dikonsumsi di dunia.'
    },
    {
      'jenis': 'Beras Merah',
      'gambar': 'assets/beras/berasMerah.jpeg',
      'deskripsi': 'Mengandung lebih banyak nutrisi dan mineral dibandingkan beras putih. Cocok untuk orang yang sedang diet atau penderita diabetes.'
    },
    {
      'jenis': 'Beras Hitam',
      'gambar': 'assets/beras/berasHitam.jpeg',
      'deskripsi': 'Memiliki warna hitam pekat atau ungu, yang berasal dari antosianin, sebuah senyawa antioksidan. '
    },
    {
      'jenis': 'Beras Basmati',
      'gambar': 'assets/beras/berasBasmati.jpeg',
      'deskripsi': 'Beras yang berasal dari India dan Pakistan ini memiliki bentuk bulir panjang dan ramping. '
    },
    {
      'jenis': 'Beras Coklat',
      'gambar': 'assets/beras/berasCoklat.jpg',
      'deskripsi': 'Sekilas beras ini mirip dengan beras merah, namun memiliki warna lebih pucat. Cocok dikonsumsi penderita diabetes.'
    },
    {
      'jenis': 'Beras Ketan',
      'gambar': 'assets/beras/berasKetan.jpg',
      'deskripsi': 'Jenis beras bulir pendek yang menjadi lengket saat dimasak, biasanya berwarna lebih putih dari beras biasa.'
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
                                width: 110,
                                height: 110,
                                beras['gambar']!,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5, bottom: 5, left:7),
                                      child: Text(
                                        beras['jenis']!,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 7, bottom: 7, left: 7,),
                                      width: 330,
                                      child: Text(
                                        beras['deskripsi']!,
                                        style: TextStyle(
                                          fontSize: 13.5,
                                        ),
                                      ),
                                    )
                                  ],
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
