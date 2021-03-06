import 'package:ui/redux/models/homeItem.dart';
import 'package:ui/redux/viewModel.dart';
import 'package:ui/setting/responsiveSize.dart';
import 'package:ui/setting/responsiveWidget.dart';
import 'package:ui/setting/strings.dart';
import 'package:ui/setting/styling.dart';
import 'package:ui/redux/appState.dart';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeScreenState();

}

class HomeScreenState extends State<HomeScreen> {
  List<Widget> _buildList(List<HomeItem> list) {
    List<Widget> items = []; // this will hold Rows according to available lines
    for (var line in list.toList()) {
      items.add(HomeItem(
          name: line.name,
          recommended: line.recommended,
          price: line.price,
          rating: line.rating,
          imagePath: line.imagePath
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize().init(context);
    return Scaffold(
      backgroundColor: AppTheme.white,
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.0 * ResponsiveSize.width,
                                vertical: 3.2 * ResponsiveSize.height,
                              ),
                              child: Text(
                                Strings.HostelsNearby,
                                style: Theme.of(context).textTheme.title,
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: _buildList(viewModel.hostelsNearby)
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.0 * ResponsiveSize.height),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.0 * ResponsiveSize.width,
                                  vertical: 1 * ResponsiveSize.height,
                                ),
                                child: Text(
                                  Strings.IDeals,
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: _buildList(viewModel.hostelsNearby)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
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
      heightFactor: 0.55,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 2.5 * ResponsiveSize.height),
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 2.5 * ResponsiveSize.height,
                left: 2 * ResponsiveSize.height,
                right: 2 * ResponsiveSize.height,
                bottom: 2.5 * ResponsiveSize.height,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: 6.5 * ResponsiveSize.height,
                      padding: EdgeInsets.symmetric(horizontal: 2 * ResponsiveSize.height),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1 * ResponsiveSize.height,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.searchHere,
                                ),
                                style: Theme.of(context).textTheme.display2,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.search,
                            size: 3 * ResponsiveSize.height,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 2 * ResponsiveSize.height,
                    right: 1.5 * ResponsiveSize.height,
                  ),
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
                        border: Border.all(color: AppTheme.topBarBackgroundColor)
                    ),
                    child: Text("Dates", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 2 * ResponsiveSize.height,
                  ),
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
                        border: Border.all(color: AppTheme.topBarBackgroundColor)
                    ),
                    child: Text("Guests", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 2.8 * ResponsiveSize.height
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
  double heightElement = 5.0;

  @override
  Widget build(BuildContext context) {
    if(ResponsiveSize.width * 100 > 450){
      heightElement = 4;
    }

    return FractionallySizedBox(
      heightFactor: 0.892,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 2 * ResponsiveSize.height),
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 2.5 * ResponsiveSize.height,
                left: 4 * ResponsiveSize.height,
                right: 4 * ResponsiveSize.height,
                bottom: 2.5 * ResponsiveSize.height,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: 6.5 * ResponsiveSize.height,
                      padding: EdgeInsets.symmetric(horizontal: 2 * ResponsiveSize.height),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1 * ResponsiveSize.height,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.searchHere,
                                ),
                                style: Theme.of(context).textTheme.display2,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.search,
                            size: 3 * ResponsiveSize.height,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 2 * ResponsiveSize.height,
                    right: 1.5 * ResponsiveSize.height,
                  ),
                  child: Container(
                    height: heightElement * ResponsiveSize.height,
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
                        border: Border.all(color: AppTheme.topBarBackgroundColor)
                    ),
                    child: Text("Dates", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 2 * ResponsiveSize.height,
                  ),
                  child: Container(
                    height: heightElement * ResponsiveSize.height,
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
                        border: Border.all(color: AppTheme.topBarBackgroundColor)
                    ),
                    child: Text("Guests", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 2.8 * ResponsiveSize.height
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
          ],
        ),
      ),
    );
  }
}