import 'package:ui/pages/searchScreen/partItem.dart';
import 'package:ui/pages/searchScreen/slider.dart';
import 'package:ui/pages/searchScreen/sortItem.dart';
import 'package:ui/pages/searchScreen/typeItem.dart';
import 'package:ui/redux/viewModel.dart';
import 'package:ui/setting/responsiveSize.dart';
import 'package:ui/setting/responsiveWidget.dart';
import 'package:ui/setting/strings.dart';
import 'package:ui/setting/styling.dart';
import 'package:ui/redux/appState.dart';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';



class SearchScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => SearchScreenState();

}

class SearchScreenState extends State<SearchScreen> {
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
                                  children: <Widget>[
                                    PartItem(title: 'SORT'),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 4.7 * ResponsiveSize.height
                                      ),
                                    ),
                                    Container(
                                      height: 5 * ResponsiveSize.height,
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(left: 3 * ResponsiveSize.width),
                                                  child: SortItem(title: "Dates"),
                                                ),
                                                SortItem(title: "Recommended"),
                                                SortItem(title: "Price"),
                                                SortItem(title: "Ratings"),
                                                SortItem(title: "Recently Added"),
                                              ]
                                          )
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 4.7 * ResponsiveSize.height
                                      ),
                                    ),
                                    PartItem(title: 'PRICE RANGE'),
                                    RangeSliderItem(
                                      initialMinValue: 1,
                                      initialMaxValue: 50000,
                                      onMinValueChanged: (v){},
                                      onMaxValueChanged: (v){},
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 2.8 * ResponsiveSize.height
                                      ),
                                    ),
                                    PartItem(title: 'TYPES'),
                                    Container(
                                      padding: EdgeInsets.only(top: 4.5 * ResponsiveSize.height),
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                TypeItem(title: 'Hotels'),
                                                TypeItem(title: 'Hostels')
                                              ]
                                          )
                                      ),
                                    )
                                  ],
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
      heightFactor: 0.29,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 4.5 * ResponsiveSize.height),
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 1.5 * ResponsiveSize.height),
                      child: Text('Options', style: TextStyle(fontSize: 17)),
                    )
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 3 * ResponsiveSize.width, top: 1.5 * ResponsiveSize.height),
                  child: Text('Reset', style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.normal)),
                ),
                Container(
                  height: 3 * ResponsiveSize.height,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 1.5 * ResponsiveSize.width),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: (){

                    },
                  ),
                )
              ],
            ),
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
      heightFactor: 0.45,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 4.5 * ResponsiveSize.height),
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 1.5 * ResponsiveSize.height),
                      child: Text('Options', style: TextStyle(fontSize: 17)),
                    )
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 3 * ResponsiveSize.width, top: 1.5 * ResponsiveSize.height),
                  child: Text('Reset', style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.normal)),
                ),
                Container(
                  height: 3 * ResponsiveSize.height,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 1.5 * ResponsiveSize.width),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: (){

                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}