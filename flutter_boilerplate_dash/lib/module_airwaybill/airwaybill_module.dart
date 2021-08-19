import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_airwaybill/ui/screen/airwaybill_details_screen.dart';
import 'package:pasco_shipping/module_airwaybill/ui/screen/airwaybill_filter_screen.dart';
import 'package:pasco_shipping/module_airwaybill/ui/screen/airwaybill_finance_screen.dart';
import 'package:pasco_shipping/module_airwaybill/ui/screen/airwaybill_new_screen.dart';
import 'package:pasco_shipping/module_airwaybill/ui/screen/airwaybill_screen.dart';
import 'package:pasco_shipping/module_airwaybill/ui/screen/airwaybill_shipment_review_screen.dart';

import 'airwaybill_routes.dart';

@injectable
class AirwaybillModule extends YesModule {
  final AirwaybillScreen _screen;
  final AddNewAirwaybill _addNewContainer;
  final AirwaybillFilterScreen _filterScreen;
  final AirwaybillDetailsScreen _detailsScreen;
  final AirwaybillShipmentReview _containerShipmentReview;
  final AirwaybillFinanceScreen _financeScreen;

  AirwaybillModule(this._screen, this._addNewContainer, this._filterScreen, this._detailsScreen, this._containerShipmentReview, this._financeScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AirwaybillRoutes.VIEW_ALL: (context) => _screen,
      AirwaybillRoutes.ADD_NEW: (context) => _addNewContainer,
      AirwaybillRoutes.FILTER: (context) => _filterScreen,
      AirwaybillRoutes.DETAILS: (context) => _detailsScreen,
      AirwaybillRoutes.FINANCE: (context) => _financeScreen,
      AirwaybillRoutes.AIRWAYBILL_SHIPMENT_REVIEW: (context) => _containerShipmentReview,
    };
  }
}
