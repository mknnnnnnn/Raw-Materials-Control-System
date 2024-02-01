// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:tigms/screens/LoginScreen.dart';
import 'package:tigms/screens/Produkcja/Produkcja.dart';
import 'package:tigms/screens/Produkcja/SurowcePost.dart';
import 'package:tigms/screens/Produkcja/ZleceniaPost.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginScreen());
  }
}
