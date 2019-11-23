import 'package:flutter/material.dart';
import 'package:ui/setting/responsive_widget.dart';
import 'package:ui/setting/size_config.dart';
import 'package:ui/setting/strings.dart';
import 'package:ui/setting/styling.dart';

class HomeScreen extends StatelessWidget {
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
                  constraints: BoxConstraints(maxHeight: 72 * SizeConfig.heightMultiplier),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.0 * SizeConfig.widthMultiplier,
                          vertical: 3.0 * SizeConfig.heightMultiplier,
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
                                rating: 4,
                                imagePath: 'assets/graphic_designer.jpg',
                                lessonName: Strings.graphicDesigner,
                                numberOfCourses: "234",
                              ),
                              PortraitCard(
                                rating: 3,
                                imagePath: 'assets/swimming.jpg',
                                lessonName: Strings.swimming,
                                numberOfCourses: "34",
                              ),
                              PortraitCard(
                                rating: 3,
                                imagePath: 'assets/swimming.jpg',
                                lessonName: Strings.swimming,
                                numberOfCourses: "34",
                              ),
                              PortraitCard(
                                rating: 3,
                                imagePath: 'assets/swimming.jpg',
                                lessonName: Strings.swimming,
                                numberOfCourses: "34",
                              ),
                              PortraitCard(
                                rating: 3,
                                imagePath: 'assets/swimming.jpg',
                                lessonName: Strings.swimming,
                                numberOfCourses: "34",
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.0 * SizeConfig.widthMultiplier,
                          vertical: 1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          Strings.joinAWorkshop,
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              PortraitCard(
                                rating: 3,
                                imagePath: 'assets/graphic_designer.jpg',
                                lessonName: Strings.graphicDesigner,
                                numberOfCourses: "234",
                              ),
                              PortraitCard(
                                rating: 3,
                                imagePath: 'assets/swimming.jpg',
                                lessonName: Strings.swimming,
                                numberOfCourses: "34",
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
        color: Theme
            .of(context)
            .buttonColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme
            .of(context)
            .primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
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

class PortraitCard extends StatelessWidget {
  final String imagePath, lessonName, numberOfCourses;
  final double rating;

  const PortraitCard({Key key, this.rating, this.imagePath, this.lessonName, this.numberOfCourses}) : super(key: key);

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
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fitHeight,
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
                ),
                Text(
                  lessonName,
                  style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "$numberOfCourses Courses",
                  style: Theme.of(context).textTheme.subtitle,
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
                          Strings.greetingMessage,
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