import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';

class SubcontractState{}


class LoadingState extends SubcontractState{}

class SuccessfullyFetchState extends SubcontractState{
  List<SubcontractModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends SubcontractState{
  ConfirmResponse response;
  List<SubcontractModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends SubcontractState{
  String error;

  ErrorState(this.error);
}