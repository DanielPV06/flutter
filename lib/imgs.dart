import 'dart:math';

import 'package:flutter/material.dart';

class imgs extends StatefulWidget {
  const imgs({super.key});

  @override
  State<imgs> createState() => _State();
}

class _State extends State<imgs> {
  int imagen1 = 1;

  void changeImg() {
    setState(() {
      imagen1 = Random().nextInt(10);
      imagen1++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imagenes"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.deepPurpleAccent,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [imagen(imagen1: imagen1, changeImg: changeImg)],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: changeImg,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Cambiar imagen",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ])
        ],
      ),
    );
  }
}

class imagen extends StatelessWidget {
  final int imagen1;
  final VoidCallback changeImg;

  const imagen({super.key, required this.imagen1, required this.changeImg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: changeImg,
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: ClipRRect(
            child: Image.asset(
              "assets/art/cuadro$imagen1.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
