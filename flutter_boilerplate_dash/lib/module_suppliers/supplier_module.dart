import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_suppliers/supplier_routes.dart';
import 'package:pasco_shipping/module_suppliers/ui/screen/suppliers_new_screen.dart';
import 'package:pasco_shipping/module_suppliers/ui/screen/suppliers_screen.dart';
@injectable
class SupplierModule extends YesModule {
  final SuppliersScreen _screen;
  final AddNewSupplier _addNewSupplier;

  SupplierModule(this._screen, this._addNewSupplier) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      SupplierRoutes.VIEW_ALL: (context) => _screen,
      SupplierRoutes.ADD_NEW: (context) => _addNewSupplier,
    };
  }
}
