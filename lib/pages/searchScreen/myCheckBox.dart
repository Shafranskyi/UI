import 'package:flutter/material.dart';
import 'package:ui/setting/responsiveSize.dart';
import 'package:ui/setting/styling.dart';

class MyCheckBox extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => MyCheckBoxState();

}

class MyCheckBoxState extends State<MyCheckBox> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
      width: 4.5 * ResponsiveSize.height,
      height: 4.5 * ResponsiveSize.height,
      decoration: BoxDecoration(
        color: isChecked ? AppTheme.selectedTabBackgroundColor : Colors.grey[200],
        borderRadius: BorderRadius.all(
            Radius.circular(8.0)
        ),
      ),
      child: SizedBox(
        height: 4.0 * ResponsiveSize.height,
        width: 4.0 * ResponsiveSize.height,
        child:  IconButton(
          padding: EdgeInsets.all(0.0),
          color: AppTheme.white,
          icon: Icon(isChecked ? Icons.check : null),
          iconSize: 4 * ResponsiveSize.height,
          onPressed: (){
            setState(() {
              isChecked = !isChecked;
            });
          },
        ),
      ),
    );
  }
}
















