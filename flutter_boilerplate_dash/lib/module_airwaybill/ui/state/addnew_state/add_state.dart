import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_shipper/response/shipper_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';

class AddAirwaybillState{}

class InitAddState extends AddAirwaybillState{
  List<SubcontractModel> subcontracts;
  List<ClientModel> clients;
  List<HarborModel> harbors;
  List<ShipperModel> shippers;
  InitAddState({required  this.subcontracts , required this.clients , required this.harbors ,required this.shippers});
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