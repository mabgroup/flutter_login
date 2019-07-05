import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget{
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Let Me in! ',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}