import 'package:flutter/material.dart';
import 'package:ui/setting/sizeConfig.dart';

class MyTab extends StatefulWidget{
  final String title;

  const MyTab({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyTabState(this.title);

}

class MyTabState extends State<MyTab>{
  final String title;

  MyTabState(this.title);

  @override
  Widget build(BuildContext context) {
    double width = 21.7;


    if(MediaQuery.of(context).size.shortestSide > 600){
      width = 24.4;
      if(MediaQuery.of(context).orientation == Orientation.landscape) {
        width = 47.3;
      }
    }
    else{
      width = 21.7;
      if(MediaQuery.of(context).orientation == Orientation.landscape) {
        width = 42.5;
      }
    }




    return Container(
      child: Align(
        child: Text(
            title,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal
            )
        ),
        alignment: Alignment.center,
      ),
      height: 5 * SizeConfig.heightMultiplier,
      width: width * SizeConfig.widthMultiplier,
    );
  }
}