import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:ui/pages/homeScreen/homeScreen.dart';
import 'package:ui/redux/appState.dart';
import 'package:ui/redux/reducers.dart';
import 'package:ui/setting/styling.dart';
import 'package:ui/setting/sizeConfig.dart';

//import 'package:ui/pages/splashScreen/splash_screen.dart';

void main()
{
  final Store<AppState> _store = Store<AppState>(appStateReducer, initialState: AppState.initialState());

  runApp(MyApp(store: _store));
}

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
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: LayoutBuilder(
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
        )
    );
  }
}