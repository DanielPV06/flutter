import 'dart:math';

import 'package:flutter/material.dart';

class frases extends StatefulWidget {
  const frases({super.key});

  @override
  State<frases> createState() => _State();
}

class _State extends State<frases>{

  List<String> frases1 = [
    "¡Hola, Flutter!",
    "Desarrolla tus sueños con Flutter",
    "Widgets por doquier",
    "El futuro es móvil con Flutter",
    "Código bonito, interfaz hermosa",
    "Aprende, crea, disfruta con Flutter",
    "¡Widgets, widgets, widgets!",
    "Explora el mundo de Flutter",
    "Dart y Flutter, la combinación perfecta",
    "Diseña con pasión, codifica con Flutter",
    "Flutter: donde la magia cobra vida",
    "Haz realidad tus ideas con Flutter",
    "La simplicidad de Flutter, la potencia de Dart",
    "Construye experiencias asombrosas con Flutter",
    "Crea aplicaciones increíbles con Flutter",
    "Dartánganos, a programar con Flutter",
    "Flutter: la joya de la programación móvil",
    "Widgets personalizados, experiencias únicas",
    "Dart es el camino, Flutter es el destino",
    "¡Desarrolla con estilo en Flutter!",
  ];




  String getRandomFrase() {
    return frases1[Random().nextInt(frases1.length)];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
      body: Stack(
        children: [
          Container(color: Colors.black,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(""),
                            content: Text(getRandomFrase()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK", textAlign: TextAlign.left,),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Presione para obtener una frase",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}