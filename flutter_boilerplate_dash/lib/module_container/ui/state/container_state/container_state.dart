import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class ContainersState{}


class LoadingState extends ContainersState{}

class SuccessfullyFetchState extends ContainersState{
  List<ContainerModel> travels;

  SuccessfullyFetchState(this.travels);
}

class SuccessfullyModifyState extends ContainersState{
  ConfirmResponse response;
  List<ContainerModel> travels;

  SuccessfullyModifyState(this.response, this.travels);
}

class ErrorState extends ContainersState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}