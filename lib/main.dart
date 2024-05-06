import 'package:flutter/material.dart';
import 'package:voltz/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MaterialApp(
    home: VoltzMain()
  ));
}

class VoltzMain extends StatefulWidget {
  VoltzMain({super.key});

  static const Color cinzaVoltz = Color(0xFFA4A4A4);
  static const Color azulVoltz = Color(0xFF2F88CC);
  static const Color brancoAcizentado = Color(0xFFEAEAEA);

  @override
  State<VoltzMain> createState() => _VoltzMainState();
}

class _VoltzMainState extends State<VoltzMain> {
  TextEditingController controladorEmail = TextEditingController();
  TextEditingController controladorSenha = TextEditingController();

  bool usuarioExiste = false;

  Future<void> criarConta(String email, String senha) async {
    if (email == '' || senha == '') {
      usuarioExiste = false;
      print('Falha ao criar conta, um ou mais campos estão vazios');
      return;
    }

    try {
      QuerySnapshot consulta = await FirebaseFirestore.instance
      .collection('usuarios')
      .where('email', isEqualTo: email)
      .get();

      if (consulta.size == 0) {
        await FirebaseFirestore.instance.collection('usuarios').add({
          'email': email,
          'senha': senha,
        });

        usuarioExiste = true;
        print('Usuário criado com sucesso');
      } else {
        usuarioExiste = false;
        print('Falha ao criar conta, conta já existente');
      }
    } catch (e) {
      print('Erro ao criar conta: $e');
    }
  }

  Future<void> efetuarLogin(String email, String senha) async {
    if (email == '' || senha == '') {
      usuarioExiste = false;
      print('Falha ao efetuar login, um ou mais campos estão vazios');
      return;
    }

    try {
      QuerySnapshot consulta = await FirebaseFirestore.instance
      .collection('usuarios')
      .where('email', isEqualTo: email)
      .where('senha', isEqualTo: senha)
      .get();

      if (consulta.size == 0) {
        usuarioExiste = false;
        print('O email e(ou) a senha estão errados ou o usuário não existe');
      } else {
        usuarioExiste = true;
        print('Login efetuado com sucesso');
      }
    } catch (e) {
      print('Erro ao efetuar login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VoltzMain.brancoAcizentado,
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/fundo.png',
                    ),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 6, 20, 6),
              child: TextField(
                controller: controladorEmail,
                style: const TextStyle(
                  color: VoltzMain.azulVoltz,
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.normal
                ),
                autocorrect: false,
                cursorColor: VoltzMain.azulVoltz,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: VoltzMain.azulVoltz,
                      width: 2
                    ),
                  ),
                  contentPadding: EdgeInsets.all(13.5),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: VoltzMain.cinzaVoltz,
                    ),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: VoltzMain.cinzaVoltz,
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    fontWeight: FontWeight.normal
                  )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 1, 20, 2),
              child: TextField(
                controller: controladorSenha,
                style: const TextStyle(
                    color: VoltzMain.azulVoltz,
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    fontWeight: FontWeight.normal
                ),
                cursorColor: VoltzMain.azulVoltz,
                autocorrect: false,
                enableSuggestions: false,
                obscureText: true,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: VoltzMain.azulVoltz,
                        width: 2
                    ),
                  ),
                  contentPadding: EdgeInsets.all(13.5),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: VoltzMain.cinzaVoltz,
                    ),
                  ),
                  hintText: 'Senha',
                  hintStyle: TextStyle(
                      color: VoltzMain.cinzaVoltz,
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(192, 3, 0, 4),
              child: const Text(
                'Esqueceu a senha? Clique aqui',
                style: TextStyle(
                  color: VoltzMain.azulVoltz,
                  fontSize: 12,
                  fontFamily: 'Raleway',
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                criarConta(controladorEmail.text, controladorSenha.text).then((_) {
                  if (usuarioExiste) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: VoltzMain.brancoAcizentado,
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Fechar',
                              style: TextStyle(
                                color: VoltzMain.azulVoltz,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold
                              ),
                            )
                          )
                        ],
                        title: const Text(
                          'Erro ao criar conta',
                          style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold)
                        ),
                        content: const Text(
                          'Você tentou criar uma conta com um email já registrado ou um ou mais campos não foram preenchidos.',
                          style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal)
                        )
                      )
                    );
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(106, 10, 106, 10),
                margin: const EdgeInsets.fromLTRB(0, 4, 0, 6),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: VoltzMain.azulVoltz,
                        width: 2
                    ),
                    borderRadius: BorderRadius.circular(4)
                ),
                child: const Text(
                  'Criar uma conta',
                  style: TextStyle(
                      color: VoltzMain.azulVoltz,
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                efetuarLogin(controladorEmail.text, controladorSenha.text).then((_) {
                  if (usuarioExiste) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: VoltzMain.brancoAcizentado,
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Fechar',
                              style: TextStyle(
                                color: VoltzMain.azulVoltz,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold
                              ),
                            )
                          )
                        ],
                        title: const Text(
                          'Erro ao efetuar login',
                          style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold)
                        ),
                        content: const Text(
                          'O email e(ou) a senha estão errados, o usuário não existe ou um ou mais campos não foram preenchidos.',
                          style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal)
                        )
                      )
                    );
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(156, 10, 156, 10),
                margin: const EdgeInsets.fromLTRB(0, 4, 0, 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: VoltzMain.azulVoltz
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
