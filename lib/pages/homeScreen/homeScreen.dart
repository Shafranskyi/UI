import 'package:ui/redux/model.dart';
import 'package:ui/redux/viewModel.dart';
import 'package:ui/setting/responsiveWidget.dart';
import 'package:ui/setting/sizeConfig.dart';
import 'package:ui/setting/strings.dart';
import 'package:ui/setting/styling.dart';
import 'package:ui/redux/appState.dart';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomeScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => HomeScreenState();

}

class HomeScreenState extends State<HomeScreen> {
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(3.0 * SizeConfig.heightMultiplier),
                          ),
                        ),
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.0 * SizeConfig.widthMultiplier,
                                vertical: 3.2 * SizeConfig.heightMultiplier,
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
                              padding: EdgeInsets.only(top: 2.0 * SizeConfig.heightMultiplier),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.0 * SizeConfig.widthMultiplier,
                                  vertical: 1 * SizeConfig.heightMultiplier,
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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _cIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.grey[500]),
              activeIcon: Icon(
                Icons.home,
                color: AppTheme.selectedTabBackgroundColor,
              ),
              title: new Text('Home', style: TextStyle(color: AppTheme.selectedTabBackgroundColor ),),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore,color: Colors.grey[500]),
                activeIcon: Icon(
                  Icons.explore,
                  color: AppTheme.selectedTabBackgroundColor,
                ),
                title: new Text('Search', style: TextStyle(color: AppTheme.selectedTabBackgroundColor ))
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.business_center,color: Colors.grey[500]),
                activeIcon: Icon(
                  Icons.business_center,
                  color: AppTheme.selectedTabBackgroundColor,
                ),
                title: new Text('My Booking', style: TextStyle(color: AppTheme.selectedTabBackgroundColor ))
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.email,color: Colors.grey[500]),
                activeIcon: Icon(
                  Icons.email,
                  color: AppTheme.selectedTabBackgroundColor,
                ),
                title: new Text('Connect', style: TextStyle(color: AppTheme.selectedTabBackgroundColor ))
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person,color: Colors.grey[500]),
                activeIcon: Icon(
                  Icons.person,
                  color: AppTheme.selectedTabBackgroundColor,
                ),
                title: new Text('Profile', style: TextStyle(color: AppTheme.selectedTabBackgroundColor ))
            )
          ],
          onTap: (_cIndex){
            _incrementTab(_cIndex);
          }
      ),
    );
  }
}

List<Widget> _buildList(List<Item> list) {
  List<Widget> items = []; // this will hold Rows according to available lines
  for (var line in list.toList()) {
    items.add(Item(
        lessonName: line.lessonName,
        recommended: line.recommended,
        numberOfCourses: line.numberOfCourses,
        rating: line.rating,
        imagePath: line.imagePath
    ));
  }
  return items;
}

class TopContainerPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.55,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 2.5 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
          color: AppTheme.appBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 2.5 * SizeConfig.heightMultiplier,
                left: 2 * SizeConfig.heightMultiplier,
                right: 2 * SizeConfig.heightMultiplier,
                bottom: 2.5 * SizeConfig.heightMultiplier,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: 6.5 * SizeConfig.heightMultiplier,
                      padding: EdgeInsets.symmetric(horizontal: 2 * SizeConfig.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1 * SizeConfig.heightMultiplier,
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
                            size: 3 * SizeConfig.heightMultiplier,
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
                    left: 2 * SizeConfig.heightMultiplier,
                    right: 1.5 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    height: 5 * SizeConfig.heightMultiplier,
                    padding: EdgeInsets.only(
                        left: 2 * SizeConfig.heightMultiplier,
                        right: 2 * SizeConfig.heightMultiplier,
                        bottom: SizeConfig.heightMultiplier,
                        top: SizeConfig.heightMultiplier
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
                    right: 2 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    height: 5 * SizeConfig.heightMultiplier,
                    padding: EdgeInsets.only(
                        left: 2 * SizeConfig.heightMultiplier,
                        right: 2 * SizeConfig.heightMultiplier,
                        bottom: SizeConfig.heightMultiplier,
                        top: SizeConfig.heightMultiplier
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
                  top: 2.8 * SizeConfig.heightMultiplier
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
          ],
        ),
      ),
    );
  }
}

class TopContainerLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.78,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 5 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 2.5 * SizeConfig.heightMultiplier,
                left: 4 * SizeConfig.heightMultiplier,
                right: 4 * SizeConfig.heightMultiplier,
                bottom: 2.5 * SizeConfig.heightMultiplier,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: 6.5 * SizeConfig.heightMultiplier,
                      padding: EdgeInsets.symmetric(horizontal: 2 * SizeConfig.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1 * SizeConfig.heightMultiplier,
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
                            size: 3 * SizeConfig.heightMultiplier,
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
                    left: 2 * SizeConfig.heightMultiplier,
                    right: 1.5 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    height: 5 * SizeConfig.heightMultiplier,
                    padding: EdgeInsets.only(
                        left: 2 * SizeConfig.heightMultiplier,
                        right: 2 * SizeConfig.heightMultiplier,
                        bottom: SizeConfig.heightMultiplier,
                        top: SizeConfig.heightMultiplier
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
                    right: 2 * SizeConfig.heightMultiplier,
                  ),
                  child: Container(
                    height: 5 * SizeConfig.heightMultiplier,
                    padding: EdgeInsets.only(
                        left: 2 * SizeConfig.heightMultiplier,
                        right: 2 * SizeConfig.heightMultiplier,
                        bottom: SizeConfig.heightMultiplier,
                        top: SizeConfig.heightMultiplier
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
                  top: 2.8 * SizeConfig.heightMultiplier
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
          ],
        ),
      ),
    );
  }
}