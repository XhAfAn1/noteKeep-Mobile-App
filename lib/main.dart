import 'package:flutter/material.dart';
import 'package:notekeep/MainWheretoGo.dart';
import 'package:notekeep/views/home_screen.dart';
import 'package:notekeep/views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        //home:  splash_screen(),
        //home:  home_screen(),
        home: mainlog());
  }
}
