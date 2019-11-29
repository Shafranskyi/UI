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
  double width = 20.5;

  MyTabState(this.title);

  @override
  Widget build(BuildContext context) {

    if(MediaQuery.of(context).orientation == Orientation.portrait)
      width = 20.5;
    else
      width = 42.5;

    print('{$width}');

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