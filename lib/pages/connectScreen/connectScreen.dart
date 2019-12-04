import 'package:ui/redux/models/connectItem.dart';
import 'package:ui/redux/viewModel.dart';
import 'package:ui/setting/responsiveSize.dart';
import 'package:ui/setting/responsiveWidget.dart';
import 'package:ui/setting/strings.dart';
import 'package:ui/setting/styling.dart';
import 'package:ui/redux/appState.dart';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ConnectScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ConnectScreenState();

}

class ConnectScreenState extends State<ConnectScreen> {
  List<Widget> _buildList(List<ConnectItem> list) {
    List<Widget> items = []; // this will hold Rows according to available lines
    for (var line in list.toList()) {
      items.add(ConnectItem(
        imagePath: line.imagePath,
        countMessages: line.countMessages,
        lastMessage: line.lastMessage,
        lastTime: line.lastTime,
        location: line.location,
        name: line.name,
      ));
      items.add(
        Divider(color: Colors.grey[300], thickness: 1, height: 1),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: StoreConnector<AppState, ViewModel>(
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (BuildContext context, ViewModel viewModel) {
            return SafeArea(
              bottom: false,
              left: true,
              right: true,
              top: false,
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(maxHeight: 40 * (MediaQuery.of(context).orientation == Orientation.portrait ? ResponsiveSize.height : ResponsiveSize.width)),
                        child: Stack(
                          children: <Widget>[
                            ResponsiveWidget(
                              portraitLayout: TopContainerPortrait(),
                              landscapeLayout: TopContainerLandscape(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxHeight: 88 * ResponsiveSize.height),
                        decoration: BoxDecoration(
                          color: AppTheme.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: _buildList(viewModel.connects)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
            );
          }
      ),
    );
  }
}


class TopContainerPortrait extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => TopContainerPortraitState();
}

class TopContainerPortraitState extends State<TopContainerPortrait> {

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.54,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 6.0 * ResponsiveSize.height),
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                    child: Text('Connect', style: TextStyle(fontSize: 17))
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 3 * ResponsiveSize.width),
                  child: Text('Blocked', style: TextStyle(fontSize: 17, color: Colors.grey, fontWeight: FontWeight.normal)),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 2.5 * ResponsiveSize.height
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
            Container(
              padding: EdgeInsets.only(
                top: 2.3 * ResponsiveSize.height,
                left: 4 * ResponsiveSize.height,
                right: 4 * ResponsiveSize.height,
                bottom: 2.3 * ResponsiveSize.height,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: 5.2 * ResponsiveSize.height,
                      padding: EdgeInsets.symmetric(horizontal: 2 * ResponsiveSize.height),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.search,
                                  size: 2.5 * ResponsiveSize.height,
                                  color: Colors.grey[600],
                                ),
                                border: InputBorder.none,
                                hintText: Strings.SearchConnect,
                                hintStyle: TextStyle(fontSize: 14)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
          ],
        ),
      ),
    );
  }
}


class TopContainerLandscape extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => TopContainerLandscapeState();
}

class TopContainerLandscapeState extends State<TopContainerLandscape> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.896,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 6.0 * ResponsiveSize.height),
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                    child: Text('Connect', style: TextStyle(fontSize: 17))
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 3 * ResponsiveSize.width),
                  child: Text('Blocked', style: TextStyle(fontSize: 17, color: Colors.grey, fontWeight: FontWeight.normal)),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 2.5 * ResponsiveSize.height
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
            Container(
              padding: EdgeInsets.only(
                top: 2.3 * ResponsiveSize.height,
                left: 4 * ResponsiveSize.height,
                right: 4 * ResponsiveSize.height,
                bottom: 2.3 * ResponsiveSize.height,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: 5.2 * ResponsiveSize.height,
                      padding: EdgeInsets.symmetric(horizontal: 2 * ResponsiveSize.height),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.search,
                                    size: 2.5 * ResponsiveSize.height,
                                    color: Colors.grey[600],
                                  ),
                                  border: InputBorder.none,
                                  hintText: Strings.SearchConnect,
                                  hintStyle: TextStyle(fontSize: 14)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
          ],
        ),
      ),
    );
  }
}