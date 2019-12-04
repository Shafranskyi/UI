import 'package:ui/redux/models/connectItem.dart';
import 'package:ui/redux/models/myBookingItem.dart';

import './actions.dart';
import './appState.dart';
import 'models/homeItem.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    hostelsNearby: homeItemReducer(state.hostelsNearby, action),
    connects: connectItemReducer(state.connects, action),
    myBookings: myBookingItemReducer(state.myBookings, action),
  );
}

List<HomeItem> homeItemReducer(List<HomeItem> state, action) {
  if (action is LoadedItemsAction) {
    return action.hostelsNearby;
  }

  return state;
}

List<MyBookingItem> myBookingItemReducer(List<MyBookingItem> state, action) {
  if (action is LoadedItemsAction) {
    return action.myBookings;
  }

  return state;
}

List<ConnectItem> connectItemReducer(List<ConnectItem> state, action) {
  if (action is LoadedItemsAction) {
    return action.connects;
  }

  return state;
}