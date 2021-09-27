import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_shipper/shipper_routes.dart';
import 'package:pasco_shipping/module_shipper/ui/screen/shipper_new_screen.dart';
import 'package:pasco_shipping/module_shipper/ui/screen/shipper_screen.dart';
@injectable
class ShipperModule extends YesModule {
  final ShipperScreen _screen;
  final AddNewShipper _addNewShipper;

  ShipperModule(this._screen, this._addNewShipper) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ShipperRoutes.VIEW_ALL: (context) => _screen,
      ShipperRoutes.ADD_NEW: (context) => _addNewShipper,
    };
  }
}
