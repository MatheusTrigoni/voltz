import 'package:flutter/material.dart';
import 'package:voltz/components/alerta.dart';
import 'package:voltz/components/header.dart';
import 'package:voltz/main.dart';

class Perfil extends StatelessWidget {
  final String email;
  const Perfil({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final double largura = MediaQuery.of(context).size.width;
    final double altura = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF2F2F2F),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(titulo: 'Perfil'),
          Container(
            margin: EdgeInsets.fromLTRB(largura * 0.078, 50, 0, 0),
            child: Text(
              'Email: $email',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Raleway',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(largura * 0.77, altura * 0.576, 0, 0),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VoltzMain()));
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 60,
              ),
            ),
          )
        ],
      ),
    );
  }
}
