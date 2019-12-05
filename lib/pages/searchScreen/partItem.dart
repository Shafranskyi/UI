import 'package:flutter/material.dart';
import 'package:ui/setting/responsiveSize.dart';

class PartItem extends StatelessWidget {
  final String title;

  PartItem({Key key, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 7 * ResponsiveSize.height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Padding(
          padding: EdgeInsets.only(left: 3 * ResponsiveSize.width),
          child: Text(title, style: TextStyle(color: Colors.grey, fontSize: 14.5),)
      ),
    );
  }
}