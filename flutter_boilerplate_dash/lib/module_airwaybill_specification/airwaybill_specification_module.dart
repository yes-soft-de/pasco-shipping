import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_airwaybill_specification/ui/screen/airwaybillSpecification_new_screen.dart';
import 'package:pasco_shipping/module_airwaybill_specification/ui/screen/airwaybillSpecification_screen.dart';

import 'airwaybill_specification_routes.dart';

@injectable
class AirwaybillSpecificationModule extends YesModule {
  final AirwaybillSpecificationsScreen _screen;
  final AddNewAirwaybillSpecification _addNewContainerSpecification;

  AirwaybillSpecificationModule(this._screen, this._addNewContainerSpecification) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AirwaybillSpecificationRoutes.VIEW_ALL: (context) => _screen,
      AirwaybillSpecificationRoutes.ADD_NEW: (context) => _addNewContainerSpecification,
    };
  }
}
