import 'package:flutter/material.dart';
import 'package:ui/pages/homeScreen/home_screen.dart';

import 'package:ui/setting/styling.dart';
import 'package:ui/setting/size_config.dart';

//import 'package:ui/pages/splashScreen/splash_screen.dart';

void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: HomeScreen(),
//    );
//  }
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Learning Platform Application',
              theme: AppTheme.lightTheme,
              home: HomeScreen(),
            );
          },
        );
      },
    );
  }
}