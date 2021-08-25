import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/screen/accepted_shipment_details_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/screen/accepted_shipment_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/screen/accepted_shipment_status_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/screen/filter_accepted_shipment_screen.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/screen/view_warehouse_screen.dart';

import 'accepted_shipment_routes.dart';
import 'ui/screen/accepted_shipment_finance_screen.dart';

@injectable
class AcceptedShipmentModule extends YesModule {
  final AcceptedShipmentDetailsScreen _detailsScreen;
  final AcceptedShipmentStatusScreen _statusScreen;
  final AcceptedShipmentScreen _acceptedShipmentScreen;
  final AcceptedShipmentFilterScreen _filterScreen;
  final AcceptedShipmentFinanceScreen _financeScreen;
  final ViewWarehouseScreen _viewWarehouseScreen;


  AcceptedShipmentModule(this._acceptedShipmentScreen,this._detailsScreen, this._filterScreen, this._statusScreen, this._financeScreen, this._viewWarehouseScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AcceptedShipmentRoutes.VIEW_ALL: (context) => _acceptedShipmentScreen,
      AcceptedShipmentRoutes.DETAILS: (context) => _detailsScreen,
      AcceptedShipmentRoutes.FILTER: (context) => _filterScreen,
      AcceptedShipmentRoutes.STATUS: (context) => _statusScreen,
      AcceptedShipmentRoutes.FINANCE: (context) => _financeScreen,
      AcceptedShipmentRoutes.SELECT_WAREHOUSE: (context) => _viewWarehouseScreen,

    };
  }
}