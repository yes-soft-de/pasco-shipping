import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';

class FilterContainerState{}

class InitFilterState extends FilterContainerState{
  List<SubcontractModel> subcontracts;
  List<ContainerSpecificationModel> specification;
  InitFilterState({required  this.subcontracts , required this.specification});
}
class LoadingFilterState extends FilterContainerState{}

// class SuccessfullyAddState extends FilterTravelState{
//   ConfirmResponse response;
//
//   SuccessfullyAddState(this.response);
// }

class ErrorFilterState extends FilterContainerState{
  String error;

  ErrorFilterState(this.error);
}