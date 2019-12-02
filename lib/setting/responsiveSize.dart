import 'package:flutter/material.dart';
import 'package:ui/setting/sizeConfig.dart';

class ResponsiveSize{

  static bool phonePort;
  static bool phoneLand;
  static bool tabLand;
  static bool tabPort;

  static double width;
  static double height;

  void init(BuildContext context){

    if(MediaQuery.of(context).orientation == Orientation.portrait){
      height = MediaQuery.of(context).size.height / 100;
      width = MediaQuery.of(context).size.width / 100;
    }
    else{
      width = MediaQuery.of(context).size.height / 100;
      height = MediaQuery.of(context).size.width / 100;
    }

    if(MediaQuery.of(context).size.width < 600 && Orientation.portrait == MediaQuery.of(context).orientation){
      print('phonePort');
      phonePort = true;
      phoneLand = false;
      tabPort = false;
      tabLand = false;
    }
    else if(Orientation.landscape == MediaQuery.of(context).orientation && SizeConfig.heightMultiplier * 100 == MediaQuery.of(context).size.width){
      print('phoneLand');
      phonePort = false;
      phoneLand = true;
      tabLand = false;
      tabPort = false;
    }
    else if(MediaQuery.of(context).size.width > 600 && Orientation.portrait == MediaQuery.of(context).orientation) {
      print('tabPort');
      phonePort = false;
      phoneLand = false;
      tabPort = true;
      tabLand = false;
    }
    else if(MediaQuery.of(context).size.width > 600 && Orientation.landscape == MediaQuery.of(context).orientation){
      print('tabLand');
      phonePort = false;
      phoneLand = false;
      tabPort = false;
      tabLand = true;
    }

  }

}