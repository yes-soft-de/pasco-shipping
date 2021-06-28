import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_home/home_routes.dart';
import 'package:pasco_shipping/module_home/ui/screen/home_screen.dart';
import 'package:pasco_shipping/module_shipment_previous/previous_routes.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/screen/result_tarcking_screen.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/screen/shipment_previous_screen.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/screen/shipment_request_screen.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/screen/shipment_tracking_screen.dart';

import 'ui/screen/review_request_shipp.dart';

@injectable
class PreviousShipmentsModule extends YesModule {
  final ShipmentPreviousScreen _previousScreen;
  final ShipmentTrackingScreen _trackingScreen;
  // final ShipmentRequest _requestScreen;
  final ResultTrackingScreen _resultTrackingScreen;
  final ReviewShipmentScreen _reviewShipmentScreen;

  PreviousShipmentsModule(this._previousScreen, this._trackingScreen , this._resultTrackingScreen, this._reviewShipmentScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      PreviousShipmentsRoutes.PREVIOUS_SHIPMENTS: (context) => _previousScreen,
      PreviousShipmentsRoutes.TRACKING_SHIPMENTS: (context) => _trackingScreen,
      // PreviousShipmentsRoutes.REQUEST_SHIPMENTS: (context) => _requestScreen,
      PreviousShipmentsRoutes.RESULT_TRACKING_SHIPMENTS: (context) => _resultTrackingScreen,
      PreviousShipmentsRoutes.REVIEW_SHIPMENTS :(context) => _reviewShipmentScreen
    };
  }
}