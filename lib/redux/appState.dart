import 'package:flutter/foundation.dart';
import 'package:ui/setting/strings.dart';

import './model.dart';

class AppState {
  final List<Item> hostelsNearby;

  AppState({
    @required this.hostelsNearby,
  });

  AppState.initialState() : hostelsNearby =
  List.unmodifiable(
      <Item>[
        Item(rating: 2,
            imagePath: 'assets/image2.png',
            lessonName: Strings.LisbonSA,
            numberOfCourses: "234",
            recommended: false
        ),
        Item(
          rating: 3.5,
          imagePath: 'assets/image3.png',
          lessonName: Strings.BBHotelBerlin,
          numberOfCourses: "34",
          recommended: true,
        ),
        Item(
          rating: 3,
          imagePath: 'assets/image4.png',
          lessonName: Strings.ParkPlazaWB,
          numberOfCourses: "55",
          recommended: false,
        )
      ]
  );

  AppState.fromJson(Map json)
      : hostelsNearby = (json['hostelsNearby'] as List).map((i) => Item.fromJson(i)).toList();

  Map toJson() => {'hostelsNearby': hostelsNearby};
}