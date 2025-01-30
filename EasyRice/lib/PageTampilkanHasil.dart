import 'package:flutter/material.dart';

class Hasil extends StatelessWidget {
  const Hasil({super.key, required this.hasil});

  final Map<String, double> hasil;

  @override
  Widget build(BuildContext context) {
    return Text(hasil['beras'].toString()) ;
  }
}