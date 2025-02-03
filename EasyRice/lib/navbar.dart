import 'package:flutter/material.dart';

AppBar navbar() {
  return AppBar(
    title: Row(
      children: [
        Container(
              child: Image.asset('logo.png',
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ) 
              
            ),
        Column(
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
            'Cooking Rice Made Easy',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
                    ),
            
          ],
        ),
      ],
    ),
    backgroundColor: Colors.green[600], 
    elevation: 10, 
    toolbarHeight: 90, 
    automaticallyImplyLeading: false, 
  );
}


