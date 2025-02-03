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
  bool _iskilogram = false;

  Map<String, double> hasil = {};
  void hitung() {
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
      double beratBerasValue = double.tryParse(beratBeras) ?? 0;
      if (_iskilogram == true) {
        beratBerasValue *= 1000;
      }
      hasil = takaranBeras!.hitungTakaran(gramBeras: beratBerasValue);
      hasil['beras'] = beratBerasValue;
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
                  labelText: 'Berat beras (gram/kilogram)',
                ),
              ),
              const SizedBox(height: 10),
               Container(
                padding: const EdgeInsets.all(12),
                child: Row(children: [
                  Text(
                    'gram',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Switch(
                      value: _iskilogram,
                      onChanged: (value) {
                        setState(() {
                          _iskilogram = value;
                        });
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'kilogram',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 20,),
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
                        builder: (context) =>
                            Hasil(hasil: hasil, beras: widget.beras),
                      ),
                    );
                  },
                  child: const Text(
                    'Hitung',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 50,),
              TextField(
                controller: _porsiNasiInput,
                decoration: const InputDecoration(
                  labelText: 'Porsi nasi yang diinginkan',
                ),
              ),
              
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
                        builder: (context) =>
                            Hasil(hasil: hasil, beras: widget.beras),
                      ),
                    );
                  },
                  child: const Text(
                    'Hitung',
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
