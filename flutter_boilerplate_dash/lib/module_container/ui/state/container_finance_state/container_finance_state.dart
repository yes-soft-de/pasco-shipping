import 'package:pasco_shipping/module_container/response/container_finance_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';

class FinanceContainerState{}


class LoadingState extends FinanceContainerState{}

class addFinanceSuccessfullyState extends FinanceContainerState{
  ConfirmResponse response;
  addFinanceSuccessfullyState(this.response);
}

class SuccessfullyFetchState extends FinanceContainerState{
  Data  finances;
  List<SubcontractModel> subcontracts;
  List<ProxyModel> proxies;

  SuccessfullyFetchState(this.finances,this.subcontracts,this.proxies);
}

class ErrorState extends FinanceContainerState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}