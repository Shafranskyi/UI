import 'package:ui/redux/models/myBookingItem.dart';

import 'models/connectItem.dart';
import 'models/homeItem.dart';

class LoadedItemsAction {
  final List<HomeItem> hostelsNearby;
  final List<ConnectItem> connects;
  final List<MyBookingItem> myBookings;

  LoadedItemsAction(this.hostelsNearby, this.connects, this.myBookings);
}