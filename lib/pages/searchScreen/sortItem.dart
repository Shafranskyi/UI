import 'package:flutter/material.dart';
import 'package:ui/setting/responsiveSize.dart';
import 'package:ui/setting/styling.dart';

class SortItem extends StatefulWidget{
  final String title;

  SortItem({Key key, @required this.title});

  @override
  State<StatefulWidget> createState() => SortItemState(this.title);

}

class SortItemState extends State<SortItem> {
  bool isChecked = false;
  final String title;

  SortItemState(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 1.5 * ResponsiveSize.height,
      ),
      child: GestureDetector(
        onTap: (){
          setState(() {
            isChecked = !isChecked;
          });
        },
        child: Container(
          height: 5 * ResponsiveSize.height,
          padding: EdgeInsets.only(
              left: 2 * ResponsiveSize.height,
              right: 2 * ResponsiveSize.height,
              bottom: ResponsiveSize.height,
              top: ResponsiveSize.height
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all(color: AppTheme.topBarBackgroundColor),
            color: isChecked ? AppTheme.selectedTabBackgroundColor : AppTheme.white
          ),
          child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
        ),
      )
    );
  }
}