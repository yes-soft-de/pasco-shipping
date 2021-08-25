import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_warehouses/manager/warehouses_manager.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_add_finance_request.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_filter_finance_request.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_filter_request.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_request.dart';
import 'package:pasco_shipping/module_warehouses/response/warehouse_finance_response.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';


@injectable
  class WarehouseService {
  final WarehouseManager _manager;
  WarehouseService(this._manager);

  Future<ConfirmResponse?> createWarehouses(WarehouseRequest request) {
    return _manager.createWarehouses(request);
  }
  Future<ConfirmResponse?> updateWarehouses(WarehouseRequest request) {
    return _manager.updateWarehouses(request);
  }
  Future<ConfirmResponse?> deleteWarehouses(String id) {
    return _manager.deleteWarehouses(id);
  }
  Future<List<WarehousesModel>?> getWarehouses(WarehouseFilterRequest request) {
    return _manager.getWarehouses(request);
  }

  Future<ConfirmResponse?> createWarehouseFinance(WarehouseAddFinanceRequest request) {
    return _manager.createWarehouseFinance(request);
  }

  Future<List<WarehouseFinanceModel>?> getWarehouseFinance(WarehouseFilterFinanceRequest request) {
    return _manager.getWarehouseFinance(request);
  }
}