import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/shipment_finance_response.dart';

class FinanceShipmentsState{}


class LoadingState extends FinanceShipmentsState{}

class addFinanceSuccessfullyState extends FinanceShipmentsState{
  ConfirmResponse response;
  addFinanceSuccessfullyState(this.response);
}

class SuccessfullyFetchState extends FinanceShipmentsState{
  DataFinance  finances;

  SuccessfullyFetchState(this.finances);
}

class ErrorState extends FinanceShipmentsState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}