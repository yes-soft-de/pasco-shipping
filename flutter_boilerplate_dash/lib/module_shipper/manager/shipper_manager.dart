import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipper/repository/shipper_repository.dart';
import 'package:pasco_shipping/module_shipper/request/shipper_request.dart';
import 'package:pasco_shipping/module_shipper/response/shipper_response.dart';

@injectable
class ShipperManager{
  final ShipperRepository _repository;
  ShipperManager(this._repository);

  Future<ConfirmResponse?> createShipper(ShipperRequest request) => _repository.createShipper(request);
  Future<ConfirmResponse?> deleteShipper(String id) => _repository.deleteShipper(id);
  Future<List<ShipperModel>?> getShipper() => _repository.getShipper();
  Future<ConfirmResponse?> updateShipper(ShipperRequest request) => _repository.updateShipper(request);


}