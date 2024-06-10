import 'package:flutter/material.dart';
import 'package:voltz/components/header.dart';

class Pagar extends StatelessWidget {
  const Pagar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF2F2F2F),
      body: Column(
        children: [
          Header(titulo: 'Pagar')
        ],
      ),
    );
  }
}
