import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';

class AddAirwaybillState{}

class InitAddState extends AddAirwaybillState{
  List<SubcontractModel> subcontracts;
  List<AirwaybillSpecificationModel> specifications;
  InitAddState({required  this.subcontracts  , required this.specifications});
}
class LoadingAddState extends AddAirwaybillState{}

class SuccessfullyAddState extends AddAirwaybillState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddAirwaybillState{
  String error;

  ErrorAddState(this.error);
}