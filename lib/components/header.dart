import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String titulo;

  const Header({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    final double largura = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(largura * 0.078, 62, 0, 0),
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 56, largura * 0.078, 0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('images/fechar.png'),
            color: Colors.white,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              padding: MaterialStatePropertyAll(EdgeInsets.all(17.9))
            ),
          ),
        ),
      ],
    );
  }
}
