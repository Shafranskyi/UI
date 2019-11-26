import './actions.dart';
import './appState.dart';
import './model.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    hostelsNearby: itemReducer(state.hostelsNearby, action),
  );
}

List<Item> itemReducer(List<Item> state, action) {
  if (action is LoadedItemsAction) {
    return action.hostelsNearby;
  }

  return state;
}