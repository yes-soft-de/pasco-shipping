import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddAirwaybillSpecificationState{}

class InitAddState extends AddAirwaybillSpecificationState{}
class LoadingAddState extends AddAirwaybillSpecificationState{}

class SuccessfullyAddState extends AddAirwaybillSpecificationState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddAirwaybillSpecificationState{
  String error;

  ErrorAddState(this.error);
}