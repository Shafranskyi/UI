import 'package:ui/redux/models/connectItem.dart';

import './actions.dart';
import './appState.dart';
import 'models/homeItem.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    hostelsNearby: homeItemReducer(state.hostelsNearby, action),
    connects: connectItemReducer(state.connects, action),
  );
}

List<HomeItem> homeItemReducer(List<HomeItem> state, action) {
  if (action is LoadedItemsAction) {
    return action.hostelsNearby;
  }

  return state;
}

List<ConnectItem> connectItemReducer(List<ConnectItem> state, action) {
  if (action is LoadedItemsAction) {
    return action.connects;
  }

  return state;
}