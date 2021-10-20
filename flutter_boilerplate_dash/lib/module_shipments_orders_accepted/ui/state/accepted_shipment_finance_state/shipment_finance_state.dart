import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/shipment_finance_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';

class FinanceShipmentsState{}


class LoadingState extends FinanceShipmentsState{}

class addFinanceSuccessfullyState extends FinanceShipmentsState{
  ConfirmResponse response;
  addFinanceSuccessfullyState(this.response);
}

class SuccessfullyFetchState extends FinanceShipmentsState{
  List<SubcontractModel> subcontracts;
  List<ProxyModel> proxies;
  DataFinance  finances;

  SuccessfullyFetchState(this.finances, this.subcontracts ,this.proxies);
}

class ErrorState extends FinanceShipmentsState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}