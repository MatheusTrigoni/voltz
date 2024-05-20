import 'package:flutter/material.dart';

class NavOption extends StatefulWidget {
  final String titulo;
  final Color azul = const Color(0xFF2F88CC);
  final Color cinzaEscuro = const Color(0xFF2F2F2F);

  const NavOption({super.key, required this.titulo});

  @override
  State<NavOption> createState() => _NavOptionState();
}

class _NavOptionState extends State<NavOption> {
  late Color _cor;
  late String _caminhoImagem;
  bool _selecionado = false;

  void _mudaEstado() {
    setState(() {
      if (_selecionado) {
        _cor = widget.cinzaEscuro;
        _caminhoImagem = 'images/flecha-not-selected.png';
        _selecionado = false;
      } else {
        _cor = widget.azul;
        _caminhoImagem = 'images/flecha-selected.png';
        _selecionado = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () {
      //  _mudaEstado();
      //},
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 12, 14.42, 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          //border: Border.fromBorderSide(BorderSide.none),
          color: _cor
        ),
        child: Row(
            children: [
              Text(
                widget.titulo,
                style: const TextStyle(
                  color: Color(0xFFEAEAEA),
                  fontFamily: 'Raleway',
                  fontSize: 16,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10.42, 0, 0, 0),
                child:
                  Image(image: AssetImage(_caminhoImagem)) // Variável
              )
            ]
        ),
      ),
    );
  }
}
