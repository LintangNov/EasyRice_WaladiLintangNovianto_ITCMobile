import 'package:flutter/material.dart';
import 'package:mini_project_warmindo/classHitungTakaran.dart';
import 'navbar.dart';
import 'tampilkanHasilPage.dart';

class Pagehitungtakaran extends StatefulWidget {
  final Map<String, String> beras;
  const Pagehitungtakaran({super.key, required this.beras});

  @override
  State<Pagehitungtakaran> createState() => _PagehitungtakaranState();
}

class _PagehitungtakaranState extends State<Pagehitungtakaran> {
  final TextEditingController _beratBerasInput = TextEditingController();
  final TextEditingController _porsiNasiInput = TextEditingController();

  Map<String, double> hasil = {};
  void hitung () {
    String beratBeras = _beratBerasInput.text;
    String porsiNasi = _porsiNasiInput.text;
    String jenisBeras = widget.beras['jenis']!;

    takaran? takaranBeras;
    if (jenisBeras == 'Beras Putih') {
      takaranBeras = berasPutih();
    } else if (jenisBeras == 'Beras Merah') {
      takaranBeras = berasMerah();
    } else if (jenisBeras == 'Beras Hitam') {
      takaranBeras = berasHitam();
    } else if (jenisBeras == 'Beras Basmati') {
      takaranBeras = berasBasmati();
    } else if (jenisBeras == 'Beras Coklat') {
      takaranBeras = berasCoklat();
    } else if (jenisBeras == 'Beras Ketan') {
      takaranBeras = berasKetan();
    }
    

    if (beratBeras.isNotEmpty) {
      hasil = takaranBeras!.hitungTakaran(gramBeras: double.parse(beratBeras));
      hasil['beras'] = double.parse(beratBeras);
    } else if (porsiNasi.isNotEmpty) {
      hasil = takaranBeras!.hitungTakaran(sajianNasi: int.parse(porsiNasi));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: navbar(),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'Hitung Takaran Beras dan Air untuk ${widget.beras['jenis']} ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _beratBerasInput,
                decoration: const InputDecoration(
                  labelText: 'Berat beras (gram)',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _porsiNasiInput,
                decoration: const InputDecoration(
                  labelText: 'Porsi nasi',
                ),
              ),
              const SizedBox(height: 20),
              Text('* Harap isi salah satu dari dua input di atas'),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    
                    backgroundColor: Colors.green[700],
                  ),
                  onPressed: () {
                    hitung();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Hasil(hasil: hasil, beras:widget.beras),
                      ),
                    );
                
                  },
                  child: const Text('Hitung',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
