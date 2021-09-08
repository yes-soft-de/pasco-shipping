import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_unit/repository/unit_repository.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';


@injectable
class UnitManager{
  final UnitRepository _repository;
  UnitManager(this._repository);

  Future<List<UnitModel>?> getUnit() => _repository.getUnits();


}