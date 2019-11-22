import 'package:flutter/material.dart';
import 'package:ui/spash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: SplashScreen(),
    );
  }
}