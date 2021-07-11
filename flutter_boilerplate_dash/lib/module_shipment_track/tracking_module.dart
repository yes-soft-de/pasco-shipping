import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_shipment_track/tracking_routes.dart';
import 'package:pasco_shipping/module_shipment_track/ui/tarcing_screen.dart';

@injectable
class TrackingModule extends YesModule {
  final TrackingScreen _trackingScreen;


  TrackingModule(this._trackingScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      TracingRoutes.TRACKING_SCREEN: (context) => _trackingScreen,
    };
  }
}