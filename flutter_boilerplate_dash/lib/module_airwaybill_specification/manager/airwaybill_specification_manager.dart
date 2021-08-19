import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill_specification/repository/airwaybill_specification_repository.dart';
import 'package:pasco_shipping/module_airwaybill_specification/request/airwaybill_specification_request.dart';
import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class AirwaybillSpecificationManager{
  final AirwaybillSpecificationRepository _repository;
  AirwaybillSpecificationManager(this._repository);

  Future<ConfirmResponse?> createAirwaybillSpecification(AirwaybillSpecificationRequest request) => _repository.createAirwaybillSpecification(request);
  // Future<ConfirmResponse?> deleteSupplier(String id) => _repository.deleteSupplier(id);
  Future<List<AirwaybillSpecificationModel>?> getAirwaybillSpecifications() => _repository.getAirwaybillSpecification();
  // Future<ConfirmResponse?> updateSupplier(SupplierRequest request) => _repository.updateSupplier(request);


}