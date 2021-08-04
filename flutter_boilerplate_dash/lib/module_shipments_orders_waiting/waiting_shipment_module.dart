import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/ui/screen/waiting_shipment_details_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/ui/screen/waiting_shipment_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/waiting_shipment_routes.dart';

@injectable
class WaitingShipmentModule extends YesModule {
  final WantingShipmentDetailsScreen _detailsScreen;
  final WaitingShipmentScreen _shipmentScreen;


  WaitingShipmentModule(this._shipmentScreen,this._detailsScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      WaitingShipmentRoutes.VIEW_ALL: (context) => _shipmentScreen,
      WaitingShipmentRoutes.DETAILS: (context) => _detailsScreen,
    };
  }
}