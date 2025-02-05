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
  final _inputKey = GlobalKey<FormState>();
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
          child: Form(
            key: _inputKey,
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
            const SizedBox(height: 30),
            TextFormField(
              controller: _beratBerasInput,
              decoration: const InputDecoration(
                labelText: 'Berat beras (gram/kilogram)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                    if (_porsiNasiInput.text.isEmpty) {
                      return 'Harap isi kolom input!';
                    }
                  } else {
                    if (double.tryParse(value) == null) {
                      return 'Input harus berupa angka!';
                    } else if (double.tryParse(value)! < 0) {
                      return 'Input tidak boleh kurang dari nol!';
                    } else if (_porsiNasiInput.text.isNotEmpty) {
                      return 'Masukkan hanya salah satu (berat beras atau porsi nasi)';
                    }
                  }
                return null;
              },
            ),
            const SizedBox(height: 5),
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
            TextFormField(
              controller: _porsiNasiInput,
              decoration: const InputDecoration(
                labelText: 'Porsi Nasi',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                    if (_beratBerasInput.text.isEmpty) {
                      return 'Harap isi kolom input!';
                    }
                  } else {
                    if (double.tryParse(value) == null) {
                      return 'Input harus berupa angka!';
                    } else if (double.tryParse(value)! < 0) {
                      return 'Input tidak boleh kurang dari nol!';
                    } else if (_beratBerasInput.text.isNotEmpty) {
                      return 'Masukkan hanya salah satu (berat beras atau porsi nasi)';
                    }
                  }
                return null;
              },
            ),
            SizedBox(height: 20,),
            Text('*Isi salah satu dari dua kolom diatas'),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                ),
                onPressed: () {
                  if (_inputKey.currentState!.validate()){
                    hitung();
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Hasil(hasil: hasil, beras: widget.beras),
                    ),
                  );
                  } 
            
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
        ))
          
        ));
  }
}
