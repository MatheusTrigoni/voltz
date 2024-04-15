import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('images/fundo-app-bar.png'),
          fit: BoxFit.cover,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
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
              fillColor: const Color(0xFF2F2F2F),
              labelText: 'Endereço, Shopping...',
              labelStyle: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 16,
                color: Color(0xFF898989)
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
