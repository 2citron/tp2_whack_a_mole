import 'package:flutter/material.dart';
import 'package:tp1_whack_a_mole/background.dart';
import 'package:tp1_whack_a_mole/scoreValidator.dart';
import 'menu.dart';
import 'dart:async';
import 'playerClass.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'packscore:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Background(classeActive: Menu())
      );
  }
}

