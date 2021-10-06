import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_shifting_shipment/shifting_routes.dart';
import 'package:pasco_shipping/module_shifting_shipment/ui/screen/new_shift_screen.dart';
import 'package:pasco_shipping/module_shifting_shipment/ui/screen/shipment_shifting_screen.dart';

@injectable
class ShiftingModule extends YesModule {
  final ShipmentShiftingScreen _screen;
  final AddNewShift _addNewShift;


  ShiftingModule(this._screen, this._addNewShift) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ShiftingRoutes.VIEW_ALL: (context) => _screen,
      ShiftingRoutes.ADD: (context) => _addNewShift,
    };
  }
}
