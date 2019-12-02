import 'package:flutter/material.dart';

import 'package:ui/pages/homeScreen/starRating.dart';
import 'package:ui/setting/responsiveSize.dart';
import 'package:ui/setting/styling.dart';

class HomeItem extends StatefulWidget{
  final String imagePath, lessonName, numberOfCourses;
  final double rating;
  final bool recommended;

  HomeItem({Key key,
    @required this.rating,
    @required this.imagePath,
    @required this.lessonName,
    @required this.numberOfCourses,
    @required this.recommended
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      HomeItemState(rating, imagePath, lessonName, numberOfCourses, recommended);

  HomeItem copyWith({double rating, String imagePath, String lessonName, String numberOfCourses, String recommended}) {
    return HomeItem(
      rating: rating ?? this.rating,
      imagePath: imagePath ?? this.imagePath,
      numberOfCourses: numberOfCourses ?? this.numberOfCourses,
      recommended: recommended ?? this.recommended,
      lessonName: lessonName ?? this.lessonName,
    );
  }

  HomeItem.fromJson(Map json)
      : rating = json['rating'],
        imagePath = json['imagePath'],
        lessonName = json['lessonName'],
        numberOfCourses = json['numberOfCourses'],
        recommended = json['recommended'];

  Map toJson() => {
    'imagePath' : imagePath,
    'lessonName' : lessonName,
    'numberOfCourses' : numberOfCourses,
    'recommended' : recommended,
    'rating' : rating
  };
}

class HomeItemState extends State<HomeItem> {
  final String imagePath, lessonName, numberOfCourses;
  double rating = 0.0;
  bool like = false;
  bool recommended = false;

  HomeItemState(this.rating, this.imagePath, this.lessonName, this.numberOfCourses, this.recommended);

  bool pressFavorite(bool key) {
    return !key;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3 * ResponsiveSize.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(3 * ResponsiveSize.height),
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
                            height: 3.5 * ResponsiveSize.height,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(3.0 * ResponsiveSize.height),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.check_circle, color: Colors.green, size: 16),
                                Text("RECOMMENDED", style: TextStyle(fontSize: 11, color: AppTheme.white))
                              ],
                            ),
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
            padding: EdgeInsets.all(2.0 * ResponsiveSize.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StarRating(
                  rating: rating,
                  color: AppTheme.selectedTabBackgroundColor,
                  onRatingChanged: (rating) => setState(() => this.rating = rating),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0 * ResponsiveSize.height),
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
                  padding: EdgeInsets.only(top: 1.0 * ResponsiveSize.height),
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