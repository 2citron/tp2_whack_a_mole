import 'dart:async';
import 'playerClass.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:tp1_whack_a_mole/background.dart';

class FinDePartie extends StatefulWidget{
  final int score;
  const FinDePartie(this.score);

  @override
  State<FinDePartie> createState() => _FinDePartieState();
}


class _FinDePartieState extends State<FinDePartie> {
  DateTime date = DateTime.now();

  TextEditingController nameController = TextEditingController();

  _FinDePartieState();


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Background(classeActive:
        Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.popUntil(context, ModalRoute.withName('/menu'));
                    },
                    child: Column(
                      children: [
                        Image.asset('../images/backIcon.png', width: 75, height: 75),
                        const Text(
                          'BACK',
                          style: TextStyle(
                              color: Colors.lightBlue,
                              decoration: TextDecoration.underline,
                              fontSize: 25.0
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  '../images/validate.png',
                  width: 125,
                  height: 125,
                ),
                const Text(
                    'FIN DE PARTIE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 32.0
                    )
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 0.5,
              indent: 15,
              endIndent: 15,
              color: Colors.white,
            ),
            Row(
              children: [
                const Text(
                  'NAME:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: nameController,
                    cursorColor: Colors.purple,
                    cursorHeight: 30,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                    ),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            TextButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.height * (1/3) , 75)),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)){
                        return Colors.lightBlue;
                      }
                      return null;
                    }
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.lightBlue, width: 2)
                    )
                ),
              ),
              onPressed: () {
                // Create a Player and add it to the players table
                var player = Player(
                  id: 0,
                  name: nameController.text,
                  score: widget.score,
                  date: date,
                );
                await insertPlayer(player);
                print('Date:${date}, Name: ' + nameController.text + ', Score:  ${widget.score}');
              },
              child: const Text(
                'ENREGISTER',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0
                ),
              ),
            ),
            const Spacer(),
            const Divider(
              height: 20,
              thickness: 0.5,
              indent: 15,
              endIndent: 15,
              color: Colors.white,
            ),
          ],
        )
        )
    );
  }
}

