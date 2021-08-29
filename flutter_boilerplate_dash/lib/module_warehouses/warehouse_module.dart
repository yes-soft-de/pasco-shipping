import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_warehouses/ui/screen/warehouse_finance_screen.dart';
import 'package:pasco_shipping/module_warehouses/ui/screen/warehouse_new_screen.dart';
import 'package:pasco_shipping/module_warehouses/ui/screen/warehouse_screen.dart';
import 'package:pasco_shipping/module_warehouses/ui/screen/warehouse_update_screen.dart';
import 'package:pasco_shipping/module_warehouses/warehoue_routes.dart';
@injectable
class WarehouseModule extends YesModule {
  final WarehouseScreen _screen;
  final AddNewWarehouse _addNewWarehouse;
  final WarehouseFinanceScreen _financeScreen;
  final UpdateWarehouse _updateWarehouse;

  WarehouseModule(this._screen, this._addNewWarehouse, this._financeScreen, this._updateWarehouse) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      WarehouseRoutes.VIEW_ALL: (context) => _screen,
      WarehouseRoutes.ADD_NEW: (context) => _addNewWarehouse,
      WarehouseRoutes.FINANCE: (context) => _financeScreen,
      WarehouseRoutes.UPDATE :(context) => _updateWarehouse
    };
  }
}
