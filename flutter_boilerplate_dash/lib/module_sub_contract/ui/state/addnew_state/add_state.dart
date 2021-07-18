import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';

class AddSubcontractState{}

class InitAddState extends AddSubcontractState{
  List<SubContractServiceModel> services;
  InitAddState(this.services);
}
class LoadingAddState extends AddSubcontractState{}

class SuccessfullyAddState extends AddSubcontractState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddSubcontractState{
  String error;

  ErrorAddState(this.error);
}