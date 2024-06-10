import 'package:flutter/material.dart';
import 'package:voltz/components/header.dart';

class Carregar extends StatefulWidget {
  const Carregar({super.key});

  static const Color cinzaEscuro = Color(0xFF2F2F2F);
  static const Color azul = Color(0xFF2F88CC); // Retirar
  static const Color azulClaro = Color(0xFFA5C4DC);
  static const Color azulIcone = Color(0xFF81B3DA);
  static const Color pretoVoltz = Color(0xFF242424);
  static const Color textoNavBar = Color(0xFFEAEAEA); // Retirar

  @override
  State<Carregar> createState() => _CarregarState();
}

class _CarregarState extends State<Carregar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Carregar.cinzaEscuro,
      body: Column(
        children: [
          const Header(titulo: 'Carregar'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.fromLTRB(32, 20, 0, 0),
              child: Row(
                children: [
                  GestureDetector(
                    //onTap: () {
                    //  _mudaEstado();
                    //},
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8, 12, 14.42, 12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        //border: Border.fromBorderSide(BorderSide.none),
                        color: Carregar.azul
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Próximos a mim',
                            style: TextStyle(
                              color: Color(0xFFEAEAEA),
                              fontFamily: 'Raleway',
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10.42, 0, 0, 0),
                            child:
                              const Image(image: AssetImage('images/flecha-selected.png')) // Variável
                          )
                        ]
                      ),
                ),
              )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
