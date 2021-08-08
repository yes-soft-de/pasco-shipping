import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_container_specification/ui/screen/containerSpecification_new_screen.dart';
import 'package:pasco_shipping/module_container_specification/ui/screen/containerSpecification_screen.dart';

import 'container_specification_routes.dart';
@injectable
class ContainerSpecificationModule extends YesModule {
  final ContainerSpecificationsScreen _screen;
  final AddNewContainerSpecification _addNewContainerSpecification;

  ContainerSpecificationModule(this._screen, this._addNewContainerSpecification) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ContainerSpecificationRoutes.VIEW_ALL: (context) => _screen,
      ContainerSpecificationRoutes.ADD_NEW: (context) => _addNewContainerSpecification,
    };
  }
}
