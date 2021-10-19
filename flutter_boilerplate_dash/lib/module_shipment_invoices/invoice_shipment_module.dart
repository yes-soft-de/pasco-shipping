import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';

import 'invoice_shipment_routes.dart';
import 'ui/screen/invoices_screen.dart';
import 'ui/screen/update_invoice_screen.dart';

@injectable
class InvoiceShipmentModule extends YesModule {
  final InvoicesScreen _invoicesScreen;
  final UpdateInvoiceAttached _updateInvoiceAttached;


  InvoiceShipmentModule(this._invoicesScreen, this._updateInvoiceAttached) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      InvoiceShipmentRoutes.VIEW_ALL: (context) => _invoicesScreen,
      InvoiceShipmentRoutes.UPDATE_DOC: (context) => _updateInvoiceAttached,
    };
  }
}