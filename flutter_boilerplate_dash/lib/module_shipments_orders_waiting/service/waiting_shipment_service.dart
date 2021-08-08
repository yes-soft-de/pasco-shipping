
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/manager/waiting_shipment_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/request/accepted_rejected_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';

@injectable
class WaitingShipmentService{
  WaitingShipmentManager _manager;
  WaitingShipmentService(this._manager);

  Future<List<WaitingShipmentModel>?> getWaitingShipment(String type) {
    return _manager.getWaitingShipment(type);
  }
  Future<ConfirmResponse?> acceptedOrRejectedShipment(AcceptedOrRejectedRequest request) {
    return _manager.acceptedOrRejected(request);
  }

}