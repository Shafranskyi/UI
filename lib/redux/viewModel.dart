import './appState.dart';
import './model.dart';

import 'package:redux/redux.dart';

class ViewModel {
  final List<Item> hostelsNearby;

  ViewModel({
    this.hostelsNearby
  });

  factory ViewModel.create(Store<AppState> store) {

    return ViewModel(
      hostelsNearby: store.state.hostelsNearby,
    );
  }
}