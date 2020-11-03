import 'package:flutter/material.dart';
import './pages/home.dart';
import './widgets/bottom_navigation_bar.dart';

void main() => runApp(MyApp());

/// The main entry for this app.x
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',

      // 修改 Material Design 主题
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Try a Router'),
        ),
        body: RandomWords(),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}
