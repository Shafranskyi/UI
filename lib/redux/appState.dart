import 'package:flutter/foundation.dart';
import 'package:ui/setting/strings.dart';

import 'models/connectItem.dart';
import 'models/homeItem.dart';

class AppState {
  final List<HomeItem> hostelsNearby;
  final List<ConnectItem> connects;

  AppState({
    @required this.hostelsNearby,
    @required this.connects,
  });

  AppState.initialState() :
        hostelsNearby = List.unmodifiable( <HomeItem>[
          HomeItem(rating: 2,
              imagePath: 'assets/image2.png',
              lessonName: Strings.LisbonSA,
              numberOfCourses: "234",
              recommended: false
          ),
          HomeItem(
            rating: 3.5,
            imagePath: 'assets/image3.png',
            lessonName: Strings.BBHotelBerlin,
            numberOfCourses: "34",
            recommended: true,
          ),
          HomeItem(
            rating: 3,
            imagePath: 'assets/image4.png',
            lessonName: Strings.ParkPlazaWB,
            numberOfCourses: "55",
            recommended: false,
          ),
          HomeItem(
            rating: 3.5,
            imagePath: 'assets/image3.png',
            lessonName: Strings.BBHotelBerlin,
            numberOfCourses: "34",
            recommended: true,
          ),
          HomeItem(
            rating: 3,
            imagePath: 'assets/image4.png',
            lessonName: Strings.ParkPlazaWB,
            numberOfCourses: "55",
            recommended: false,
          )
        ]
        ),
        connects = List.unmodifiable(<ConnectItem>[
          ConnectItem(
            name: 'Juliana',
            lastTime: '12.09.19',
            location: Strings.ParkPlazaWB,
            lastMessage: 'Do you want to have coffee tonight?',
            countMessages: 0,
            imagePath: 'assets/juliana.png',
          ),
          ConnectItem(
            name: 'Juliana',
            lastTime: '12.09.19',
            location: Strings.ParkPlazaWB,
            lastMessage: 'Do you want to have coffee tonight?',
            countMessages: 0,
            imagePath: 'assets/juliana.png',
          ),
        ]);

  AppState.fromJson(Map json)
      : hostelsNearby = (json['hostelsNearby'] as List).map((i) => HomeItem.fromJson(i)).toList(),
        connects = (json['connects'] as List).map((i) => ConnectItem.fromJson(i)).toList();

  Map toJson() => {'hostelsNearby': hostelsNearby, 'connects' : connects};
}