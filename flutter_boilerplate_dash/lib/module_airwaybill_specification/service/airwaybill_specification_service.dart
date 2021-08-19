import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill_specification/manager/airwaybill_specification_manager.dart';
import 'package:pasco_shipping/module_airwaybill_specification/request/airwaybill_specification_request.dart';
import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';


@injectable
  class AirwaybillSpecificationService {
  final AirwaybillSpecificationManager _manager;
  AirwaybillSpecificationService(this._manager);

  Future<ConfirmResponse?> createAirwaybillSpecification(AirwaybillSpecificationRequest request) {
    return _manager.createAirwaybillSpecification(request);
  }
  // Future<ConfirmResponse?> updateSupplier(SupplierRequest request) {
  //   return _manager.updateSupplier(request);
  // }
  // Future<ConfirmResponse?> deleteSupplier(String id) {
  //   return _manager.deleteSupplier(id);
  // }
  Future<List<AirwaybillSpecificationModel>?> getAirwaybillSpecification() {
    return _manager.getAirwaybillSpecifications();
  }
}