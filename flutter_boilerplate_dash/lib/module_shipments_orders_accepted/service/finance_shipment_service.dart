import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/manager/finance_shipment_manager.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipemnt_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/shipment_finance_response.dart';

@injectable
class FinanceShipmentService{
  final FinanceShipmentManager _manager;
  FinanceShipmentService(this._manager);

  Future<ConfirmResponse?> createShipmentFinance(ShipmentLCLFinanceRequest request) {
    return _manager.createShipmentFinance(request);
  }
  Future<DataFinance?> getShipmentLCLFinance(ShipmentLCLFilterFinanceRequest request) {
    return _manager.getShipmentFinance(request);
  }
}