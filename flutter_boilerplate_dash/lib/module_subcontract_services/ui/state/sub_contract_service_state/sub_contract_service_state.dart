import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';

class SubContractServiceState{}


class LoadingState extends SubContractServiceState{}

class SuccessfullyFetchState extends SubContractServiceState{
  List<SubContractServiceModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends SubContractServiceState{
  ConfirmResponse response;
  List<SubContractServiceModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends SubContractServiceState{
  String error;

  ErrorState(this.error);
}