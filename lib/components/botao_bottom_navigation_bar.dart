import 'package:flutter/material.dart';
import 'package:voltz/carregar.dart';
import 'package:voltz/carteira.dart';
import 'package:voltz/pagar.dart';

class BotaoBottomNavigationBar extends StatelessWidget {
  final String titulo;
  final String imagem;

  const BotaoBottomNavigationBar({
    super.key,
    required this.titulo,
    required this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            switch (titulo) {
              case 'Carteira':
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Carteira()));
                break;
              case 'Pagar':
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Pagar()));
                break;
              case 'Carregar':
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Carregar()));
                break;
            }
          },
          icon: ImageIcon(
            AssetImage(imagem)
          ),
          color: const Color(0xFFEAEAEA)
        ),
        Text(
          titulo,
          style: const TextStyle(
            color: Color(0xFFEAEAEA),
            fontFamily: 'Raleway',
            fontSize: 16,
            fontWeight: FontWeight.normal
          ),
        )
      ],
    );
  }
}
