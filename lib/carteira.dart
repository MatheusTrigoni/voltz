import 'package:flutter/material.dart';
import 'components/header.dart';

class Carteira extends StatelessWidget {
  const Carteira({super.key});

  static const Color cinzaEscuro = Color(0xFF2F2F2F);
  static const Color azulClaro = Color(0xFFA5C4DC);
  static const Color pretoVoltz = Color(0xFF242424);

  @override
  Widget build(BuildContext context) {
    final double largura = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: cinzaEscuro,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(titulo: 'Carteira'),
            Container(
              margin: EdgeInsets.fromLTRB(largura * 0.078, 65, 0, 0),
              child: const Text(
                'Saldo Voltz',
                style: TextStyle(
                  color: azulClaro,
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(largura * 0.078, 20, 0, 0),
                  padding: EdgeInsets.fromLTRB(largura * 0.083, 30, largura * 0.083, 29),
                  decoration: const BoxDecoration(
                    color: pretoVoltz,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: Text(
                    'R\$ 0,00',
                    style: TextStyle(
                      color: azulClaro,
                      fontSize: largura * 0.073,
                      fontFamily: 'Radio Canada',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('BOTÃO ADICIONAR PRESSIONADO');
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(14, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(largura * 0.117, 18, largura * 0.117, 18),
                    decoration: const BoxDecoration(
                      color: pretoVoltz,
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: Column(
                      children: [
                        Text(
                          '+',
                          style: TextStyle(
                            color: azulClaro,
                            fontSize: largura * 0.073,
                            fontFamily: 'Radio Canada',
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const Text(
                          'Adicionar',
                          style: TextStyle(
                            color: Color(0xFF898989),
                            fontSize: 16,
                            fontFamily: 'Raleway',
                          ),
                        )
                      ],
                    )
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(largura * 0.078, 94, 0, 0),
              child: const Text(
                'Meus Cartões',
                style: TextStyle(
                    color: azulClaro,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
