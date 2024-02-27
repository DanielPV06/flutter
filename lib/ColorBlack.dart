import 'dart:math';


import 'package:flutter/material.dart';

class ColorBlack extends StatefulWidget {
  const ColorBlack({super.key});

  @override
  State<ColorBlack> createState() => _State();
}

class _State extends State<ColorBlack> {
  int indexColor = 0;

  int dado = 3;
  int dado1 = 3;

  List<Color> colorArray = [
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.yellowAccent,
    Colors.green,
    Colors.brown,
    Colors.pink,
    Colors.amberAccent,
    Colors.indigo,
    Colors.black
  ];

  void changeColor() {
    setState(() {
      indexColor = Random().nextInt(colorArray.length);
    });

    print(indexColor);
  }

  void changeDice() {
    setState(() {
      dado=Random().nextInt(6);
      dado ++;
      dado1=Random().nextInt(6);
      dado1 ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dados"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }
          ),
        ),
        body: Stack(
      children: [
          Container(color: colorArray[indexColor]),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dados(changeDice: changeDice, dado: dado),
                dados(changeDice: changeDice, dado: dado1),

              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: changeColor,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Cambiar color",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: changeDice,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Cambiar imagen",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ));
  }
}

class dados extends StatelessWidget {
  final int dado;
  final VoidCallback changeDice;

  const dados({super.key, required this.changeDice, required this.dado});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeDice,
      child:
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage("assets/img/dado${dado}.jpeg")
          )
        ),
      )
    );
  }
}

