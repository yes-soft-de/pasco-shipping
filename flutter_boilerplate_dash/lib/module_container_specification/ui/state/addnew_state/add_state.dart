import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddContainerSpecificationState{}

class InitAddState extends AddContainerSpecificationState{}
class LoadingAddState extends AddContainerSpecificationState{}

class SuccessfullyAddState extends AddContainerSpecificationState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddContainerSpecificationState{
  String error;

  ErrorAddState(this.error);
}