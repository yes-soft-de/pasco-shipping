import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shifting_shipment/repository/shipment_shifting_repo.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/filter_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/shifting_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/update_shifting_status_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/response/shipment_shifting_response.dart';

@injectable
class ShiftingManager{
  final ShiftingRepository _repository;
  ShiftingManager(this._repository);

  Future<ConfirmResponse?> createShift(ShiftingRequest request) => _repository.createShift(request);
  Future<ConfirmResponse?> deleteShift(String id) => _repository.deleteShift(id);
  Future<List<ShipmentShiftingModel>?> getShiftingShipment(ShiftingShipmentFilterRequest filterRequest) => _repository.getShiftingShipment(filterRequest);
  Future<ConfirmResponse?> updateShiftStatus(UpdateShiftingStatusRequest request) => _repository.updateShiftStatus(request);


}