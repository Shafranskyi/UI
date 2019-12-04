import 'package:ui/redux/models/connectItem.dart';
import 'package:ui/redux/models/myBookingItem.dart';

import './appState.dart';
import 'models/homeItem.dart';

import 'package:redux/redux.dart';

class ViewModel {
  final List<HomeItem> hostelsNearby;
  final List<ConnectItem> connects;
  final List<MyBookingItem> myBookings;

  ViewModel({
    this.hostelsNearby,
    this.connects,
    this.myBookings
  });

  factory ViewModel.create(Store<AppState> store) {

    return ViewModel(
      hostelsNearby: store.state.hostelsNearby,
      connects: store.state.connects,
      myBookings: store.state.myBookings
    );
  }
}