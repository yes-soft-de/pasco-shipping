import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';

class AddContainerState{}

class InitAddState extends AddContainerState{
  List<SubcontractModel> subcontracts;
  List<ContainerSpecificationModel> specifications;
  List<ClientModel> clients;
  List<HarborModel> harbor;
  InitAddState({required  this.subcontracts  , required this.specifications , required this.clients,required this.harbor });
}
class LoadingAddState extends AddContainerState{}

class SuccessfullyAddState extends AddContainerState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddContainerState{
  String error;

  ErrorAddState(this.error);
}