import 'package:ui/pages/myBookingScreen/bubbleTabIndicator.dart';
import 'package:ui/redux/models/myBookingItem.dart';
import 'package:ui/redux/viewModel.dart';
import 'package:ui/setting/responsiveSize.dart';
import 'package:ui/setting/responsiveWidget.dart';
import 'package:ui/setting/strings.dart';
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
                                children: <Widget>[
                                  MyBookingItem(
                                    name: Strings.ParkPlazaWB,
                                    lastTime: '12.09.19',
                                    location: Strings.MyBookingLocation,
                                    lastMessage: 'Do you want to have coffee tonight?',
                                    imagePath: 'assets/image5.png',
                                  )
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

//List<Widget> _buildList(List<MyBookingItem> list) {
//  List<Widget> items = []; // this will hold Rows according to available lines
//  for (var line in list.toList()) {
//    items.add(MyBookingItem(
//      imagePath: line.imagePath,
//      lastMessage: line.lastMessage,
//      lastTime: line.lastTime,
//      location: line.location,
//      name: line.name,
//    ));
//    items.add(
//      Divider(color: Colors.grey[300], thickness: 1, height: 1),
//    );
//  }
//  return items;
//}


class TopContainerPortrait extends StatefulWidget{

  const TopContainerPortrait({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TopContainerPortraitState();
}

class TopContainerPortraitState extends State<TopContainerPortrait> {

  @override
  Widget build(BuildContext context) {
    double radius = 25;

    if(ResponsiveSize.phonePort){
      radius = 25;
    }
    if(ResponsiveSize.tabPort){
      radius = 35;
    }

    return FractionallySizedBox(
      heightFactor: 0.633,
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
                    child: Text('My Bookings', style: TextStyle(fontSize: 17))
                ),
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
                top: 3.6 * ResponsiveSize.height,
                left: 3 * ResponsiveSize.height,
                right: 3 * ResponsiveSize.height,
                bottom: 3 * ResponsiveSize.height,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 7 * ResponsiveSize.height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(radius),
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
  double heightElement = 5.0;

  @override
  Widget build(BuildContext context) {
    double radius = 25;

    if(ResponsiveSize.phoneLand){
      radius = 25;
    }
    if(ResponsiveSize.tabLand){
      radius = 35;
    }

    return FractionallySizedBox(
      heightFactor: 1,
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
                    child: Text('My Bookings', style: TextStyle(fontSize: 17))
                ),
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
                top: 2.6 * ResponsiveSize.height,
                left: 4 * ResponsiveSize.height,
                right: 4 * ResponsiveSize.height,
                bottom: 2.6 * ResponsiveSize.height,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 7 * ResponsiveSize.height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(radius),
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