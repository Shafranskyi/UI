import 'package:flutter/material.dart';
import 'package:ui/setting/responsiveSize.dart';

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


    if(ResponsiveSize.phonePort){
      width = 22.0;
    }
    else if(ResponsiveSize.phoneLand){
      width = 42.5;
    }
    else if(ResponsiveSize.tabPort){
      width = 24.3;
    }
    else if(ResponsiveSize.tabLand){
      width = 47.0;
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
      height: 5 * ResponsiveSize.height,
      width: width * ResponsiveSize.width,
    );
  }
}