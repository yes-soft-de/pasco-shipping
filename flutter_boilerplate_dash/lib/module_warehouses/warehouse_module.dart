import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_warehouses/ui/screen/warehouse_new_screen.dart';
import 'package:pasco_shipping/module_warehouses/ui/screen/warehouse_screen.dart';
import 'package:pasco_shipping/module_warehouses/warehoue_routes.dart';
@injectable
class WarehouseModule extends YesModule {
  final WarehouseScreen _screen;
  final AddNewWarehouse _addNewWarehouse;

  WarehouseModule(this._screen, this._addNewWarehouse) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      WarehouseRoutes.VIEW_ALL: (context) => _screen,
      WarehouseRoutes.ADD_NEW: (context) => _addNewWarehouse,
    };
  }
}
