import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_unit/manager/unit_manager.dart';
import 'package:pasco_shipping/module_unit/request/unit_request.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';


@injectable
  class UnitService {
  final UnitManager _manager;
  UnitService(this._manager);

  Future<ConfirmResponse?> createUnit(UnitRequest request) {
    return _manager.createUnit(request);
  }
  Future<ConfirmResponse?> updateUnit(UnitRequest request) {
    return _manager.updateUnit(request);
  }
  Future<ConfirmResponse?> deleteUnit(String id) {
    return _manager.deleteUnit(id);
  }
  Future<List<UnitModel>?> getUnits() {
    return _manager.getUnits();
  }
}