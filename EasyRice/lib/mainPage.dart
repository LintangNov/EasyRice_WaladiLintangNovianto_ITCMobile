import 'package:flutter/material.dart';
import 'package:mini_project_warmindo/inputDataPage.dart';
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
      'deskripsi': 'Beras yang paling umum dan sering dikonsumsi di dunia.',
      'panduan':
          " 1. Cuci beras 2-3 kali sampai air jernih\n 2. Tambahkan air sesuai takaran diatas\n 3. masukkan ke dalam rice cooker/panci \n 4. Masak selama 20-30 menit"
    },
    {
      'jenis': 'Beras Merah',
      'gambar': 'assets/beras/berasMerah.jpeg',
      'deskripsi':
          'Mengandung lebih banyak nutrisi dan mineral dibandingkan beras putih. Cocok untuk orang yang sedang diet atau penderita diabetes.',
      'panduan': ' 1. Cuci beras 1-2 kali\n 2. Rendam beras selama 30 menit agar lebih empuk\n 3. Tambahkan air sesuai takaran\n 4. Masukkan ke dalam rice cooker/panci\n 5. masak selama 20-45 menit hingga matang'
    },
    {
      'jenis': 'Beras Hitam',
      'gambar': 'assets/beras/berasHitam.jpeg',
      'deskripsi':
          'Memiliki warna hitam pekat atau ungu, yang berasal dari antosianin, sebuah senyawa antioksidan. ',
      'panduan': ' 1. Cuci beras 1-2 kali\n 2. Rendam selama 1-2 jam agar tekstur lembut\n 3. Tambahkan air sesuai takaran\n 4. Masukkan ke dalam rice cooker atau panci\n 5. Masak selama 30-40 menit hingga matang\n 6. Diamkan selama 10 menit sebelum dihidangkan'
    },
    {
      'jenis': 'Beras Basmati',
      'gambar': 'assets/beras/berasBasmati.jpeg',
      'deskripsi':
          'Beras yang berasal dari India dan Pakistan ini memiliki bentuk bulir panjang dan ramping. ',
      'panduan': ' 1. Cuci beras hingga air bening\n 2. Rendam selama 20-30 menit agar butiran lebih panjang\n 3. Tambahkan air sesuai takaran\n 4. Masukkan ke dalam panci atau rice cooker\n 5. Masak selama 25-40 menit hingga matang'
    },
    {
      'jenis': 'Beras Coklat',
      'gambar': 'assets/beras/berasCoklat.jpg',
      'deskripsi':
          'Sekilas beras ini mirip dengan beras merah, namun memiliki warna lebih pucat. Cocok dikonsumsi penderita diabetes.',
      'panduan': ' 1. Cuci beras 1-2 kali\n 2. Rendam selama 30 menit agar lebih lunak\n 3. Tambahkan air sesuai takaran\n 4. Masukkan ke dalam panci atau rice cooker\n 5. Masak selama 30-45 menit hingga matang'
    },
    {
      'jenis': 'Beras Ketan',
      'gambar': 'assets/beras/berasKetan.jpg',
      'deskripsi':
          'Jenis beras bulir pendek yang menjadi lengket saat dimasak, biasanya berwarna lebih putih dari beras biasa.',
      'panduan': ' 1. Cuci beras 2-3 kali\n 2. Rendam beras selama 4-6 jam agar lebih lembut\n 3. Tambahkan air sesuai takaran\n 4. Tambahkan santan (opsional)\n 5. Kukus dengan dandang atau masak di rice cooker selama 30-40 menit\n 6. Jika dikukus, aduk sesekali agar nasi matang merata'
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
                        fontFamily: 'Roboto',
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  width: 115,
                                  height: 115,
                                  beras['gambar']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 3, left: 7),
                                      child: Text(
                                        beras['jenis']!,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 7,
                                        bottom: 7,
                                        left: 7,
                                      ),
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
