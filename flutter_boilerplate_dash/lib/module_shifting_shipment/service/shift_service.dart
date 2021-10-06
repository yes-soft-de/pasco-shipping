import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shifting_shipment/manager/shifting_manager.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/filter_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/shifting_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/update_shifting_status_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/response/shipment_shifting_response.dart';

@injectable
class ShiftingService {
  final ShiftingManager _manager;
  ShiftingService(this._manager);

  Future<ConfirmResponse?> createShift(ShiftingRequest request) {
    return _manager.createShift(request);
  }
  Future<ConfirmResponse?> updateShiftStatus(UpdateShiftingStatusRequest request) {
    return _manager.updateShiftStatus(request);
  }
  Future<ConfirmResponse?> deleteShift(String id) {
    return _manager.deleteShift(id);
  }
  Future<List<ShipmentShiftingModel>?> getShiftingShipment(ShiftingShipmentFilterRequest filterRequest) {
    return _manager.getShiftingShipment(filterRequest);
  }
}