
import 'package:injectable/injectable.dart';

import 'package:pasco_shipping/module_unit/manager/unit_manager.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';

@injectable
class UnitService {
  final UnitManager _manager;
  UnitService(this._manager);

  Future<List<UnitModel>?> getUnits() {
    return _manager.getUnit();
  }
}