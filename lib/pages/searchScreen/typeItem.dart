import 'package:flutter/material.dart';
import 'package:ui/pages/searchScreen/myCheckBox.dart';
import 'package:ui/setting/responsiveSize.dart';

class TypeItem extends StatelessWidget {
  final String title;

  TypeItem({Key key, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 3 * ResponsiveSize.height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5 * ResponsiveSize.width),
            child: Text(title, style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5 * ResponsiveSize.width),
            child: MyCheckBox(),
          ),
        ],
      ),
    );
  }
}