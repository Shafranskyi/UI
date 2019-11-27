import 'models/connectItem.dart';
import 'models/homeItem.dart';

class LoadedItemsAction {
  final List<HomeItem> hostelsNearby;
  final List<ConnectItem> connects;

  LoadedItemsAction(this.hostelsNearby, this.connects);
}