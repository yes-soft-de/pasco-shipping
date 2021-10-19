import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';

class AddContainerPriceState{}

class InitAddPriceContainerState extends AddContainerPriceState{
  List<Countries> countriesExport;
  List<HarborModel> harbors;
  List<ContainerSpecificationModel> specification;

  InitAddPriceContainerState({required this.countriesExport ,required this.specification , required this.harbors});
}
class LoadingAddState extends AddContainerPriceState{}

class SuccessfullyAddState extends AddContainerPriceState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddContainerPriceState{
  String error;

  ErrorAddState(this.error);
}