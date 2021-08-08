import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddSubContractServiceState{}

class InitAddState extends AddSubContractServiceState{}
class LoadingAddState extends AddSubContractServiceState{}

class SuccessfullyAddState extends AddSubContractServiceState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddSubContractServiceState{
  String error;

  ErrorAddState(this.error);
}