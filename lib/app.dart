import 'package:flutter/material.dart';
import 'screens/home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello, Flutter',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: HomeScreen(),
    );
  }
}
