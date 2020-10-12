import 'package:flutter/material.dart';
import 'HomePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF000033),
      ),
      home: MyHomePage(title: 'Corona Tracker'),
    );
  }
}

