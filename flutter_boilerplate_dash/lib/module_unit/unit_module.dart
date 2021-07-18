import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_unit/ui/screen/unit_new_screen.dart';
import 'package:pasco_shipping/module_unit/ui/screen/units_screen.dart';
import 'package:pasco_shipping/module_unit/unit_routes.dart';
@injectable
class UnitModule extends YesModule {
  final UnitsScreen _screen;
  final AddNewUnit _addNewUnit;

  UnitModule(this._screen, this._addNewUnit) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      UnitRoutes.VIEW_ALL: (context) => _screen,
      UnitRoutes.ADD_NEW: (context) => _addNewUnit,
    };
  }
}
