import 'package:flutter/material.dart';

AppBar navbar() {
  return AppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EasyRice',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'Rice Cooking Made Easy',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.green[700], // Warna latar belakang AppBar
    elevation: 5, // Efek bayangan AppBar
    toolbarHeight: 80, // Tinggi AppBar
    automaticallyImplyLeading: false, // Hilangkan tombol back
  );
}


