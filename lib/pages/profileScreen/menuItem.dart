import 'package:flutter/material.dart';
import 'package:ui/setting/responsiveSize.dart';


class MenuItem extends StatefulWidget{
  const MenuItem({ Key key, @required this.title, @required this.iconData }) : super(key: key);

  final String title;
  final IconData iconData;

  @override
  State<StatefulWidget> createState() => MenuItemState(this.title, this.iconData);

}

class MenuItemState extends State<MenuItem> {
  final String title;
  final IconData iconData;

  MenuItemState(this.title, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 1.9 * ResponsiveSize.height,
        left: 3 * ResponsiveSize.height,
        right: 3 * ResponsiveSize.height,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 8 * ResponsiveSize.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 4 * ResponsiveSize.width),
                    child: Icon(iconData, color: Colors.grey[700]),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 3 * ResponsiveSize.width),
                    child: Text(title, style: TextStyle(fontSize: 16),),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}