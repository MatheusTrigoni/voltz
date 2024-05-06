import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const Color cinzaEscuro = Color(0xFF2F2F2F);
  static const Color brancoAcizentado = Color(0xFFEAEAEA);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.089,
          flexibleSpace: const Image(
            image: AssetImage('images/fundo-app-bar.png'),
            fit: BoxFit.cover,
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  print('BOTÃO SINO PRESSIONADO');
                },
                iconSize: 48,
                color: Colors.white,
                icon: const ImageIcon(
                  AssetImage('images/sino.png')
                )
            ),
            Container( // Deveria acrescentar um Container no botão anterior?
              margin: const EdgeInsets.fromLTRB(4, 0, 32, 0),
              child: IconButton(
                  onPressed: () {
                    print('BOTÃO USUÁRIO PRESSIONADO');
                  },
                  color: Colors.black,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    padding: MaterialStatePropertyAll(EdgeInsets.zero)
                  ),
                  iconSize: 48,
                  icon: const ImageIcon(
                      AssetImage('images/user.png')
                  )
              ),
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/mapa-temp.png'),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.fromLTRB(20, 32, 20, 0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: cinzaEscuro,
                prefixIcon: const Icon(Icons.search, color: brancoAcizentado),
                hintText: 'Endereço, Shopping...',
                hintStyle: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 16,
                  color: Color(0xFF898989),
                  fontWeight: FontWeight.normal
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24)
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(0, 23, 0, 0),
          height: MediaQuery.of(context).size.height * 0.122,
          decoration: const BoxDecoration(
            color: cinzaEscuro,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      print('BOTÃO CARTEIRA PRESSIONADO');
                    },
                    icon: const ImageIcon(
                      AssetImage('images/carteira.png')
                    ),
                    color: brancoAcizentado,
                  ),
                  const Text(
                    'Carteira',
                    style: TextStyle(
                      color: brancoAcizentado,
                      fontFamily: 'Raleway',
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        print('BOTÃO CARTEIRA PRESSIONADO');
                      },
                      icon: const ImageIcon(
                          AssetImage('images/qr-code.png')
                      ),
                      color: brancoAcizentado
                  ),
                  const Text(
                    'Pagar',
                    style: TextStyle(
                        color: brancoAcizentado,
                        fontFamily: 'Raleway',
                        fontSize: 16,
                        fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        print('BOTÃO CARTEIRA PRESSIONADO');
                      },
                      icon: const ImageIcon(
                          AssetImage('images/bateria.png')
                      ),
                      color: brancoAcizentado
                  ),
                  const Text(
                    'Carregar',
                    style: TextStyle(
                        color: brancoAcizentado,
                        fontFamily: 'Raleway',
                        fontSize: 16,
                        fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
