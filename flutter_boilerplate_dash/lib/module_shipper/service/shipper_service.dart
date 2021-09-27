import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipper/manager/shipper_manager.dart';
import 'package:pasco_shipping/module_shipper/request/shipper_request.dart';
import 'package:pasco_shipping/module_shipper/response/shipper_response.dart';


@injectable
  class ShipperService {
  final ShipperManager _manager;
  ShipperService(this._manager);

  Future<ConfirmResponse?> createShipper(ShipperRequest request) {
    return _manager.createShipper(request);
  }
  Future<ConfirmResponse?> updateShipper(ShipperRequest request) {
    return _manager.updateShipper(request);
  }
  Future<ConfirmResponse?> deleteShipper(String id) {
    return _manager.deleteShipper(id);
  }
  Future<List<ShipperModel>?> getShippers() {
    return _manager.getShipper();
  }
}