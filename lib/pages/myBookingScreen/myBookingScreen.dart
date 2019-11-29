import 'package:ui/pages/myBookingScreen/bubbleTabIndicator.dart';
import 'package:ui/redux/models/connectItem.dart';
import 'package:ui/redux/viewModel.dart';
import 'package:ui/setting/responsiveWidget.dart';
import 'package:ui/setting/sizeConfig.dart';
import 'package:ui/setting/styling.dart';
import 'package:ui/redux/appState.dart';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


class MyBookingScreen extends StatefulWidget{
  const MyBookingScreen({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyBookingScreenState();

}

class MyBookingScreenState extends State<MyBookingScreen> {

  @override
  Widget build(BuildContext context) {
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
                      constraints: BoxConstraints(maxHeight: 40 * (SizeConfig.isMobilePortrait ? SizeConfig.heightMultiplier : SizeConfig.widthMultiplier)),
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
                      constraints: BoxConstraints(maxHeight: 88 * SizeConfig.heightMultiplier),
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
                                children: <Widget>[

                                ], //_buildList(viewModel.connects)
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


class TopContainerPortrait extends StatefulWidget{

  const TopContainerPortrait({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TopContainerPortraitState();
}

class TopContainerPortraitState extends State<TopContainerPortrait> {
  TopContainerPortraitState();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.65,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 6.0 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                    child: Text('My Bookings', style: TextStyle(fontSize: 17))
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 2.5 * SizeConfig.heightMultiplier
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
            Container(
              padding: EdgeInsets.only(
                top: 3.6 * SizeConfig.heightMultiplier,
                left: 4 * SizeConfig.heightMultiplier,
                right: 4 * SizeConfig.heightMultiplier,
                bottom: 3.6 * SizeConfig.heightMultiplier,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 7 * SizeConfig.heightMultiplier,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          border: Border.all(color: Colors.grey[300])
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BubbleTab(),
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
  const TopContainerLandscape({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TopContainerLandscapeState();
}

class TopContainerLandscapeState extends State<TopContainerLandscape> {
  TopContainerLandscapeState();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1.077,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 6.0 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                    child: Text('My Bookings', style: TextStyle(fontSize: 17))
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 2.5 * SizeConfig.heightMultiplier
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
            Container(
              padding: EdgeInsets.only(
                top: 3.6 * SizeConfig.heightMultiplier,
                left: 4 * SizeConfig.heightMultiplier,
                right: 4 * SizeConfig.heightMultiplier,
                bottom: 3.6 * SizeConfig.heightMultiplier,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 7 * SizeConfig.heightMultiplier,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          border: Border.all(color: Colors.grey[300]),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BubbleTab(),
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