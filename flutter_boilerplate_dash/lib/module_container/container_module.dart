import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_container/ui/screen/container_details_screen.dart';
import 'package:pasco_shipping/module_container/ui/screen/container_filter_screen.dart';
import 'package:pasco_shipping/module_container/ui/screen/container_new_screen.dart';
import 'package:pasco_shipping/module_container/ui/screen/container_screen.dart';
import 'package:pasco_shipping/module_container/ui/screen/container_shipment_review_screen.dart';

import 'container_routes.dart';
@injectable
class ContainerModule extends YesModule {
  final ContainerScreen _screen;
  final AddNewContainer _addNewContainer;
  final ContainerFilterScreen _filterScreen;
  final ContainerDetailsScreen _detailsScreen;
  final ContainerShipmentReview _containerShipmentReview;

  ContainerModule(this._screen, this._addNewContainer, this._filterScreen, this._detailsScreen, this._containerShipmentReview) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ContainerRoutes.VIEW_ALL: (context) => _screen,
      ContainerRoutes.ADD_NEW: (context) => _addNewContainer,
      ContainerRoutes.FILTER: (context) => _filterScreen,
      ContainerRoutes.DETAILS: (context) => _detailsScreen,
      ContainerRoutes.CONTAINER_SHIPMENT_REVIEW: (context) => _containerShipmentReview,
    };
  }
}
