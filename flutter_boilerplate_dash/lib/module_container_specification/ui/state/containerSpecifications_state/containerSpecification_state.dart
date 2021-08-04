import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class ContainerSpecificationsState{}


class LoadingState extends ContainerSpecificationsState{}

class SuccessfullyFetchState extends ContainerSpecificationsState{
  List<ContainerSpecificationModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends ContainerSpecificationsState{
  ConfirmResponse response;
  List<ContainerSpecificationModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends ContainerSpecificationsState{
  String error;

  ErrorState(this.error);
}