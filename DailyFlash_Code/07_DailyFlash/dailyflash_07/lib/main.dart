import 'package:dailyflash_07/Question_01.dart';
import 'package:dailyflash_07/Question_02.dart';
import 'package:dailyflash_07/Question_03.dart';
import 'package:dailyflash_07/Question_04.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assignment2()
    );
  }
}
