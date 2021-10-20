import 'package:pasco_shipping/module_airwaybill/response/airwaybill_finance_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';

class FinanceAirwaybillState{}


class LoadingState extends FinanceAirwaybillState{}

class addFinanceSuccessfullyState extends FinanceAirwaybillState{
  ConfirmResponse response;
  addFinanceSuccessfullyState(this.response);
}

class SuccessfullyFetchState extends FinanceAirwaybillState{
  Data  finances;
  List<SubcontractModel> subcontracts;
  List<ProxyModel> proxies;
  SuccessfullyFetchState(this.finances ,this.subcontracts,this.proxies);
}

class ErrorState extends FinanceAirwaybillState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}