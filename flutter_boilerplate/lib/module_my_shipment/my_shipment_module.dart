import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_my_shipment/ui/screen/my_shipment_review.dart';
import 'package:pasco_shipping/module_my_shipment/ui/screen/my_shipment_review_edited.dart';
import 'package:pasco_shipping/module_my_shipment/ui/screen/my_shipment_screen.dart';
import 'package:pasco_shipping/module_shipment_request/request_routes.dart';
import 'package:pasco_shipping/module_shipment_request/ui/screen/new_shipment_request.dart';

import 'my_shipment_routes.dart';

@injectable
class MyShipmentModule extends YesModule {
  final MyShipmentScreen _myShipmentScreen;
  final ReviewShipmentScreen _reviewShipmentScreen;
  final ReviewShipmentEditedScreen _reviewShipmentEditedScreen;

  MyShipmentModule(this._myShipmentScreen, this._reviewShipmentScreen, this._reviewShipmentEditedScreen,) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      MyShipmentRoutes.MY_SHIPMENT: (context) => _myShipmentScreen,
      MyShipmentRoutes.REVIEW_SHIPMENT: (context) => _reviewShipmentScreen,
      MyShipmentRoutes.REVIEW_EDITED_SHIPMENT: (context) => _reviewShipmentEditedScreen,
    };
  }
}
