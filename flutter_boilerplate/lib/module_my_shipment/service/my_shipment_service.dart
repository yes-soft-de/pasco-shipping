import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_my_shipment/manager/my_shipment_manager.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_active_shipment_response.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_history_shipment_response.dart';

@injectable
class MyShipmentService {
  final MyShipmentManager _manager;
  MyShipmentService(this._manager);

  Future<List<MyShipment>?> getMyActiveShipment() {
    return _manager.getMyActiveShipment();
  }
  Future<List<MyHistoryShipment>?> getMyDeliveredShipment() {
    return _manager.getMyDeliveredShipment();
  }
}