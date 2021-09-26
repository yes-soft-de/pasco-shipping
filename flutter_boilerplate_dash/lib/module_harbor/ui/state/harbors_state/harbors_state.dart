import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';

class HarborsState{}


class LoadingState extends HarborsState{}

class SuccessfullyFetchState extends HarborsState{
  List<HarborModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends HarborsState{
  ConfirmResponse response;
  List<HarborModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends HarborsState{
  String error;

  ErrorState(this.error);
}