import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_unit/repository/unit_repository.dart';
import 'package:pasco_shipping/module_unit/request/unit_request.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';

@injectable
class UnitManager{
  final UnitRepository _repository;
  UnitManager(this._repository);

  Future<ConfirmResponse?> createUnit(UnitRequest request) => _repository.createUnit(request);
  Future<ConfirmResponse?> deleteUnit(String id) => _repository.deleteUnit(id);
  Future<List<UnitModel>?> getUnits() => _repository.getUnits();
  Future<ConfirmResponse?> updateUnit(UnitRequest request) => _repository.updateUnit(request);


}