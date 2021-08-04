
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/manager/accepted_shipment_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';

@injectable
class AcceptedShipmentService{
 final AcceptedShipmentManager _manager;
  AcceptedShipmentService(this._manager);

  Future<List<AcceptedShipmentModel>?> getAcceptedShipment(AcceptedShipmentFilterRequest type) {
    return _manager.getAcceptedShipment(type);
  }
 Future<AcceptedShipmentDetailsModel?> getShipmentDetails(String id) {
   return _manager.getShipmentDetails(id);
 }
}