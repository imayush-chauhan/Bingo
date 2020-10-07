import 'package:bingo/screens/computer.dart';
import 'package:bingo/screens/home.dart';
import 'package:bingo/screens/homeScreen.dart';
import 'package:bingo/screens/howToPlay.dart';
import 'package:bingo/screens/welcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF5B16D0),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        'welcome' : (context) => Welcome(),
        'home': (context) => Home(),
        'computer': (context) => Computer(),
        'how': (context) => HowToPlay(),
      },
    );
  }
}
