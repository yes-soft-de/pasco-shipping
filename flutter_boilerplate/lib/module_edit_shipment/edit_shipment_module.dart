import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_edit_shipment/ui/screen/edited_shipment_screen.dart';
import 'edit_shipment_routes.dart';

@injectable
class EditShipmentModule extends YesModule {
  final EditedShipmentScreen _reviewShipmentEditedScreen;

  EditShipmentModule(this._reviewShipmentEditedScreen,) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      EditShipmentRoutes.REVIEW_EDITED_SHIPMENT: (context) => _reviewShipmentEditedScreen,
    };
  }
}
