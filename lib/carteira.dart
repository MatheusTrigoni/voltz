import 'package:flutter/material.dart';
import 'components/header.dart';

class Carteira extends StatelessWidget {
  const Carteira({super.key});

  static const Color cinzaEscuro = Color(0xFF2F2F2F);
  static const Color azulClaro = Color(0xFFA5C4DC);
  static const Color pretoVoltz = Color(0xFF242424);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cinzaEscuro,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(titulo: 'Carteira'),
            Container(
              margin: const EdgeInsets.fromLTRB(32, 65, 0, 0),
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
                  margin: const EdgeInsets.fromLTRB(32, 20, 0, 0),
                  padding: const EdgeInsets.fromLTRB(39, 30, 39, 29),
                  decoration: const BoxDecoration(
                    color: pretoVoltz,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: const Text(
                    'R\$ 30',
                    style: TextStyle(
                      color: azulClaro,
                      fontSize: 36,
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
                    padding: const EdgeInsets.fromLTRB(53, 18, 53, 18),
                    decoration: const BoxDecoration(
                      color: pretoVoltz,
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: const Column(
                      children: [
                        Text(
                          '+',
                          style: TextStyle(
                            color: azulClaro,
                            fontSize: 36,
                            fontFamily: 'Radio Canada',
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
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
              margin: const EdgeInsets.fromLTRB(32, 94, 0, 0),
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
