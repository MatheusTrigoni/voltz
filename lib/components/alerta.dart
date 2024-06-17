import 'package:flutter/material.dart';

class Alerta extends StatelessWidget {
  final Color corFundo;
  final Color corTexto;
  final Color corFechar;
  final String titulo;
  final String mensagem;
  final String msgSaida;

  const Alerta({
    super.key,
    this.corFundo = const Color(0xFFEAEAEA),
    this.corTexto = const Color(0xFF000000),
    this.corFechar = const Color(0xFF2F88CC),
    required this.titulo,
    required this.mensagem,
    this.msgSaida = 'Fechar'
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: corFundo,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            msgSaida,
            style: TextStyle(
              color: corFechar,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold
            ),
          )
        )
      ],
      title: Text(
        titulo,
        style: TextStyle(
          color: corTexto,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold
        )
      ),
      content: Text(
        mensagem,
        style: TextStyle(
          color: corTexto,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.normal
        )
      )
    );
  }
}
