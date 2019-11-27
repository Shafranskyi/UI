import 'package:ui/redux/models/connectItem.dart';

import './appState.dart';
import 'models/homeItem.dart';

import 'package:redux/redux.dart';

class ViewModel {
  final List<HomeItem> hostelsNearby;
  final List<ConnectItem> connects;

  ViewModel({
    this.hostelsNearby,
    this.connects
  });

  factory ViewModel.create(Store<AppState> store) {

    return ViewModel(
      hostelsNearby: store.state.hostelsNearby,
      connects: store.state.connects
    );
  }
}