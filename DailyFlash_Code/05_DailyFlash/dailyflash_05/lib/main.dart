import 'package:dailyflash_05/Question_01.dart';
import 'package:dailyflash_05/Question_04.dart';
import 'package:dailyflash_05/Question_05.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assignment1(),
    );
  }
}
