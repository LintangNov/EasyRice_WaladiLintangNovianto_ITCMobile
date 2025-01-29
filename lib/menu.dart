import 'package:flutter/material.dart';
import 'navbar.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navbar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('balik ke menu utama'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent,
          ),
          
        ),
      ),
    );
  }
}