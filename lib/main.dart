import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const MaterialApp(
  home: VoltzHome()
));

class VoltzHome extends StatelessWidget {
  const VoltzHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEAEA),
      appBar: null,
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: Image(
              image: AssetImage(
                'images/fundo.png',
              ),
              fit: BoxFit.cover,
            )
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 6, 20, 6),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA4A4A4),
                            )
                        ),
                        labelText: 'Email ou CPF',
                        labelStyle: TextStyle(
                            color: Color(0xFFA4A4A4),
                            fontFamily: 'Raleway',
                            fontSize: 20
                        )
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 1, 20, 2),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFA4A4A4),
                        ),
                      ),
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                          color: Color(0xFFA4A4A4),
                          fontFamily: 'Raleway',
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(192, 3, 0, 4),
                  child: const Text(
                    'Esqueceu a senha? Clique aqui',
                    style: TextStyle(
                      color: Color(0xFF2F88CC),
                      fontSize: 12,
                      fontFamily: 'Raleway',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(106, 10, 106, 10),
                  margin: const EdgeInsets.fromLTRB(0, 4, 0, 6),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xFF2F88CC),
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: const Text(
                    'Criar uma conta',
                    style: TextStyle(
                        color: Color(0xFF2F88CC),
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(156, 10, 156, 10),
                  margin: const EdgeInsets.fromLTRB(0, 4, 0, 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xFF2F88CC)
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
