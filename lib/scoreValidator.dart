import 'package:flutter/material.dart';
import 'package:tp1_whack_a_mole/background.dart';
import 'dart:math';

class ScoreValidator extends StatefulWidget{
  const ScoreValidator({super.key});

  @override
  State<ScoreValidator> createState() => _ScoreValidatorState();
}


class _ScoreValidatorState extends State<ScoreValidator> {
  bool _isExist = false;
  bool _isPressedOnce = false;

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController scoreController = TextEditingController();



  void buttonpressed() {
    setState(() { _isPressedOnce = true; });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Background(classeActive:
          Container(
            child : Column(
              children: [
                Container(
                    child : Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
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
                    )

                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        '../images/validate.png',
                        width: 125,
                        height: 125,
                      ),
                  const Text(
                      'SCORE VALIDATOR',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32.0
                        )
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 0.5,
                  indent: 15,
                  endIndent: 15,
                  color: Colors.white,
                ),
                  Container(
                    width: MediaQuery.of(context).size.width * (1/2),
                    child: Row(
                      children: [
                        const Text(
                          'DATE:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                          ),
                        ),
                        Expanded(
                            child: TextField(
                              controller: dateController,
                              cursorColor: Colors.purple,
                              cursorHeight: 30,
                              decoration: const InputDecoration(
                                  labelText: 'DD/MM/YYYY',
                                  labelStyle: TextStyle(
                                      color: Colors.lightBlue
                                  ),
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
                  ),
                Container(
                  width: MediaQuery.of(context).size.width * (1/2),
                  child: Row(
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
                ),
                Container(
                  width: MediaQuery.of(context).size.width * (1/2),
                  child: Row(
                    children: [
                      const Text(
                        'SCORE:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: scoreController,
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
                ),
                const Spacer(),
                Container(
                  child: TextButton(
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
                      buttonpressed();
                      print('Date: ' + dateController.text + ', Name: ' + nameController.text + ', Score: ' + scoreController.text);
                    },
                    child: const Text(
                      'VALIDATE SCORE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0
                      ),
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
                Text(
                  _isPressedOnce ? 'Score exist : $_isExist' : 'Score exist : ',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                  ),
                const Spacer()
              ],
            )
          )
      )
    );
  }
}