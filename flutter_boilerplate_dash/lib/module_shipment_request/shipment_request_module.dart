import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/module_shipment_request/ui/screen/new_shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/ui/screen/review_shipment_screen.dart';

@injectable
class NewShipmentsModule extends YesModule {
  final NewShipment _newShipment;
  final RequestShipmentReview _reviewShipmentScreen;

  NewShipmentsModule(this._newShipment,this._reviewShipmentScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      NewShipmentRoutes.NEW_SHIPMENTS: (context) => _newShipment,
      NewShipmentRoutes.REVIEW_SHIPMENTS: (context) => _reviewShipmentScreen,
    };
  }
}