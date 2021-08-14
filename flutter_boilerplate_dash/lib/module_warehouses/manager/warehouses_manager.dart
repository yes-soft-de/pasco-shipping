import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_warehouses/repository/warehouse_repository.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_request.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';

@injectable
class WarehouseManager{
  final WarehousesRepository _repository;
  WarehouseManager(this._repository);

  Future<ConfirmResponse?> createWarehouses(WarehouseRequest request) => _repository.createWarehouses(request);
  Future<ConfirmResponse?> deleteWarehouses(String id) => _repository.deleteWarehouses(id);
  Future<List<WarehousesModel>?> getWarehouses() => _repository.getWarehouses();
  Future<ConfirmResponse?> updateWarehouses(WarehouseRequest request) => _repository.updateWarehouses(request);


}