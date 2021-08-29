import 'package:pasco_shipping/module_container/response/container_details_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';

class ContainerDetailsState{}

class InitDetailsState extends ContainerDetailsState{}
class LoadingDetailsState extends ContainerDetailsState{}

class SuccessfullyDetailsState extends ContainerDetailsState{
  ContainerDetailsModel response;
  SuccessfullyDetailsState(this.response);
}
class SuccessfullyDetailsWithTravelsState extends ContainerDetailsState{
  ContainerDetailsModel response;
  // List<TravelModel> travels;
  SuccessfullyDetailsWithTravelsState(this.response);
}
class SuccessfullyUploadedContainerState extends ContainerDetailsState{
  ConfirmResponse response;
  ContainerDetailsModel containerDetailsModel;
  SuccessfullyUploadedContainerState(this.response,this.containerDetailsModel);
}
class ErrorDetailsState extends ContainerDetailsState{
  String error;

  ErrorDetailsState(this.error);
}