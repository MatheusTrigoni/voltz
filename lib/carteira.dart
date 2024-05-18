import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32, 62, 0, 0),
                  child: const Text(
                    'Carteira',
                    style: TextStyle(
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
                    //iconSize: 48,
                    color: Colors.white,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(17.9))
                    ),
                  ),
                ),
              ],
            ),
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
