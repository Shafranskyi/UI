import 'package:flutter/material.dart';

import 'package:ui/setting/sizeConfig.dart';
import 'package:ui/setting/styling.dart';

class ConnectItem extends StatefulWidget{
  final String imagePath, name, lastTime, lastMessage, location;
  final int countMessages;

  ConnectItem({Key key,
    @required this.lastTime,
    @required this.imagePath,
    @required this.lastMessage,
    @required this.location,
    @required this.name,
    @required this.countMessages
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      ConnectItemState(lastTime, imagePath, location, lastMessage, name, countMessages);

  ConnectItem copyWith({String lastTime, String imagePath, String location, String lastMessage, int countMessages}) {
    return ConnectItem(
      lastTime: lastTime ?? this.lastTime,
      imagePath: imagePath ?? this.imagePath,
      location: location ?? this.location,
      lastMessage: lastMessage ?? this.lastMessage,
      name: name ?? this.name,
      countMessages: countMessages ?? this.countMessages,

    );
  }

  ConnectItem.fromJson(Map json)
      : lastTime = json['lastTime'],
        imagePath = json['imagePath'],
        location = json['location'],
        lastMessage = json['lastMessage'],
        name = json['name'],
        countMessages = json['countMessages'];

  Map toJson() => {
    'lastTime' : lastTime,
    'imagePath' : imagePath,
    'location' : location,
    'lastMessage' : lastMessage,
    'name' : name,
    'countMessages' : countMessages,
  };
}

class ConnectItemState extends State<ConnectItem> {
  final String imagePath, name, lastTime, lastMessage, location;
  final int countMessages;

  bool isMessages = false;



  ConnectItemState(this.lastTime, this.imagePath, this.location, this.lastMessage, this.name, this.countMessages );

  @override
  Widget build(BuildContext context) {

    if(countMessages > 0)
      isMessages = true;

    final leftSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Expanded(
            flex: 8,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 35.0, right: 15.0, top: 15.0, left: 15.0),
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
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isMessages,
                  child: Positioned(
                    bottom: 35.0,
                    right: 15.0,
                    child: Container(
                      height: 3.2 * SizeConfig.heightMultiplier,
                      width: 3.2 * SizeConfig.heightMultiplier,
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.selectedTabBackgroundColor,
                      ),
                      child: Text(countMessages.toString(),
                          style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 14)
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
      child: new Container(
        padding: new EdgeInsets.only(left: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 15),
                child:
                new Text(name, style: new TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                )
            ),
            Padding(
                padding: EdgeInsets.only(top: 5),
                child:
                new Text(location, style: new TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal))),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child:
                new Text(lastMessage, style: new TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.normal), overflow: TextOverflow.ellipsis,))
          ],
        ),
      ),
    );

    final rightSection = Column(
        children: <Widget>[
          Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20.0, top: 20.0),
                  child: Text(lastTime,
                    style: new TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0
                    ),
                  ),
                ),
              ],
            ),
          )
        ]
    );

    double widthItem = 100 * SizeConfig.widthMultiplier;

    if(MediaQuery.of(context).orientation == Orientation.landscape)
      widthItem = 100 * SizeConfig.heightMultiplier;

    return Container(
      height: 14.5 * SizeConfig.heightMultiplier,
      width: widthItem,
      color: AppTheme.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          leftSection,
          middleSection,
          rightSection
        ],
      ),
    );
  }
}
























