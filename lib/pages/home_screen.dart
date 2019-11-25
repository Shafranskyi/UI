import 'package:flutter/material.dart';
import 'package:ui/setting/responsive_widget.dart';
import 'package:ui/setting/size_config.dart';
import 'package:ui/setting/strings.dart';
import 'package:ui/setting/styling.dart';

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
      backgroundColor: AppTheme.appBackgroundColor,
      body: SafeArea(
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
                            children: <Widget>[
                              PortraitCard(
                                rating: 2,
                                imagePath: 'assets/image2.png',
                                lessonName: Strings.LisbonSA,
                                numberOfCourses: "234",
                                recommended: false,
                              ),
                              PortraitCard(
                                rating: 3.5,
                                imagePath: 'assets/image3.png',
                                lessonName: Strings.BBHotelBerlin,
                                numberOfCourses: "34",
                                recommended: true,
                              ),
                              PortraitCard(
                                rating: 3,
                                imagePath: 'assets/image4.png',
                                lessonName: Strings.ParkPlazaWB,
                                numberOfCourses: "55",
                                recommended: false,
                              ),
                            ],
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
                            children: <Widget>[
                              PortraitCard(
                                rating: 3.5,
                                imagePath: 'assets/image2.png',
                                lessonName: Strings.graphicDesigner,
                                numberOfCourses: "234",
                                recommended: true,
                              ),
                              PortraitCard(
                                rating: 3,
                                imagePath: 'assets/image3.png',
                                lessonName: Strings.swimming,
                                numberOfCourses: "34",
                                recommended: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
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
      ) ,
    );
  }
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating(
      {this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        size: 16,
        color: Theme
            .of(context)
            .buttonColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        size: 16,
        color: color ?? Theme
            .of(context)
            .primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: 16,
        color: color ?? Theme
            .of(context)
            .primaryColor,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () =>
          onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}



class PortraitCard extends StatefulWidget{
  final String imagePath, lessonName, numberOfCourses;
  final double rating;
  final bool recommended;

  PortraitCard({Key key, this.rating, this.imagePath, this.lessonName, this.numberOfCourses, this.recommended}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PortraitCardState(rating, imagePath, lessonName, numberOfCourses, recommended);
}

class PortraitCardState extends State<PortraitCard> {
  final String imagePath, lessonName, numberOfCourses;
  double rating;
  bool like = false;
  bool recommended;

  PortraitCardState(this.rating, this.imagePath, this.lessonName, this.numberOfCourses, this.recommended);

  bool pressFavorite(bool key) {
    return !key;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3 * SizeConfig.widthMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(3 * SizeConfig.heightMultiplier),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        right:0.0,
                        top: 0.0,
                        child: new IconButton(
                          icon: new Icon(Icons.favorite, color:  like ? Colors.red : null),
                          onPressed: null,
                        ),
                      ),
                      Positioned(
                        right:0.0,
                        top: 0.0,
                        child: new IconButton(
                            icon: new Icon(Icons.favorite_border, color: like ? Colors.red : Colors.white),
                            onPressed: () {
                              setState(() {
                                like = pressFavorite(like); //<--update alreadSaved
                              });
                            }
                        ),
                      ),
                      Visibility(
                        visible: recommended,
                        child: Positioned(
                          left: 9.0,
                          bottom: 7.0,
                          right: 9.0,
                          child: Container(
                            height: 3.5 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(3.0 * SizeConfig.heightMultiplier),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.check_circle, color: Colors.green, size: 16),
                                Text("RECOMMENDED", style: TextStyle(fontSize: 11, color: AppTheme.white))
                              ],
                            ),
//                            icon: new Icon(Icons.favorite_border, color: like ? Colors.red : Colors.white),
//                            onPressed: () {
//                              setState(() {
//                                like = pressFavorite(like); //<--update alreadSaved
//                              });
//                            }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.0 * SizeConfig.widthMultiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StarRating(
                  rating: rating,
                  color: AppTheme.selectedTabBackgroundColor,
                  onRatingChanged: (rating) => setState(() => this.rating = rating),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0 * SizeConfig.heightMultiplier),
                  child: SizedBox(
                    width: 115,
                    child: Text(
                      lessonName,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                      softWrap: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0 * SizeConfig.heightMultiplier),
                  child: Text(
                    "\$$numberOfCourses",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
          color: AppTheme.white,
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
      heightFactor: 1,
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(24.0),
          ),
          color: AppTheme.topBarBackgroundColor,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 2.0 * SizeConfig.heightMultiplier,
                  right: 2.0 * SizeConfig.heightMultiplier,
                  top: 1.0 * SizeConfig.heightMultiplier,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          Strings.boating,
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2 * SizeConfig.heightMultiplier),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              size: 3 * SizeConfig.heightMultiplier,
                            ),
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
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.blur_on,
                      size: 8 * SizeConfig.imageSizeMultiplier,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 2.0 * SizeConfig.heightMultiplier, bottom: 1.5 * SizeConfig.heightMultiplier),
                child: Row(
                  children: <Widget>[
                    Text(
                      Strings.whatLearnToday,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Spacer(),
                    Container(
                      width: 10 * SizeConfig.heightMultiplier,
                      padding: EdgeInsets.symmetric(vertical: 1 * SizeConfig.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3.0 * SizeConfig.heightMultiplier),
                          bottomLeft: Radius.circular(3.0 * SizeConfig.heightMultiplier),
                        ),
                      ),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 6 * SizeConfig.imageSizeMultiplier,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}