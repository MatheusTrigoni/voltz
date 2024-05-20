import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String titulo;

  const Header({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(32, 62, 0, 0),
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
          margin: const EdgeInsets.fromLTRB(32, 56, 32, 0),
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
