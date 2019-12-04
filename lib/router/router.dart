import 'package:ui/pages/connectScreen/connectScreen.dart';
import 'package:ui/pages/homeScreen/homeScreen.dart';
import 'package:ui/pages/myBookingScreen/myBookingScreen.dart';
import 'package:ui/pages/profileScreen/profileScreen.dart';
import 'package:ui/setting/responsiveSize.dart';
import 'package:ui/setting/styling.dart';
import 'package:flutter/material.dart';

class Router extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => RouterState();

}

class RouterState extends State<Router> {
  int _cIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    ConnectScreen(),
    MyBookingScreen(),
    ConnectScreen(),
    ProfileScreen(),
  ];

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize().init(context);

    return Scaffold(
      backgroundColor: AppTheme.white,
      body: _children[_cIndex],
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