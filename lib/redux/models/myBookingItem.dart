import 'package:flutter/material.dart';
import 'package:ui/pages/myBookingScreen/modalWindow.dart';
import 'package:ui/setting/responsiveSize.dart';

import 'package:ui/setting/styling.dart';

class MyBookingItem extends StatefulWidget {
  final String imagePath, name, lastTime, lastMessage, location;

  MyBookingItem({Key key,
    @required this.lastTime,
    @required this.imagePath,
    @required this.lastMessage,
    @required this.location,
    @required this.name,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      MyBookingItemState(lastTime, imagePath, location, lastMessage, name);

  MyBookingItem copyWith(
      {String lastTime, String imagePath, String location, String lastMessage}) {
    return MyBookingItem(
      lastTime: lastTime ?? this.lastTime,
      imagePath: imagePath ?? this.imagePath,
      location: location ?? this.location,
      lastMessage: lastMessage ?? this.lastMessage,
      name: name ?? this.name,
    );
  }

  MyBookingItem.fromJson(Map json)
      : lastTime = json['lastTime'],
        imagePath = json['imagePath'],
        location = json['location'],
        lastMessage = json['lastMessage'],
        name = json['name'];

  Map toJson() => {
    'lastTime' : lastTime,
    'imagePath' : imagePath,
    'location' : location,
    'lastMessage' : lastMessage,
    'name' : name,
  };
}

class MyBookingItemState extends State<MyBookingItem> {
  final String imagePath, name, lastTime, lastMessage, location;
  Modal modal = new Modal();

  MyBookingItemState(this.lastTime, this.imagePath, this.location, this.lastMessage, this.name,);

  @override
  Widget build(BuildContext context) {

    double widthItem = 100 * ResponsiveSize.width;
    double widthNameAndLocationContainers = 50.0 * ResponsiveSize.width;
    double widthCheckContainers = 35 * ResponsiveSize.width;

    if(MediaQuery.of(context).orientation == Orientation.landscape) {
      widthItem = 100 * ResponsiveSize.height;
      widthNameAndLocationContainers = 70 * ResponsiveSize.height;
      widthCheckContainers = 36 * ResponsiveSize.height;
    }


    final leftSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Expanded(
            flex: 8,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 12 * ResponsiveSize.height, right: 3 * ResponsiveSize.width, top: 3.3 * ResponsiveSize.height, left: 3.5 * ResponsiveSize.width),
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );

    final middleSection =  Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 1 * ResponsiveSize.width, top: 3.5 * ResponsiveSize.height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 8 * ResponsiveSize.height,
                  width: widthNameAndLocationContainers,
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  width: 20 * ResponsiveSize.width,
                  height: 8 * ResponsiveSize.height,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => modal.mainBottomSheet(context),
                  ),
                )
              ],
            ),
            Container(
              height: 7 * ResponsiveSize.height,
              width: widthNameAndLocationContainers,
              child: Text(
                  location,
                  style: TextStyle(color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal)
              ),
            ),
            Container(
                height: 7 * ResponsiveSize.height,
                width: widthCheckContainers * 2.0,
                child: Row(
                  children: <Widget>[
                    Container(
                        width: widthCheckContainers,
                        height: 7 * ResponsiveSize.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Check-in:',
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '22 September, Sat',
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                    Container(
                      width: widthCheckContainers,
                      height: 7 * ResponsiveSize.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Check-out:',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '16 September, Mon',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );

    return Container(
      height: 28 * ResponsiveSize.height,
      width: widthItem,
      color: AppTheme.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          leftSection,
          middleSection
        ],
      ),
    );
  }
}
























