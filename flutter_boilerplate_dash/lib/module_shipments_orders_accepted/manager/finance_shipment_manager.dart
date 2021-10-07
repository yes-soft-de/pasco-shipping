import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/repository/finance_shipment_repository.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipemnt_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/shipment_finance_response.dart';

@injectable
class FinanceShipmentManager{
  final FinanceShipmentRepository _repository;
  FinanceShipmentManager(this._repository);

  Future<ConfirmResponse?> createShipmentFinance(ShipmentLCLFinanceRequest request) => _repository.createShipmentFinance(request);
  Future<DataFinance?> getShipmentFinance(ShipmentLCLFilterFinanceRequest request) => _repository.getShipmentLCLFinance(request);

}