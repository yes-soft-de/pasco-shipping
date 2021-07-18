import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';

class ProxiesState{}


class LoadingState extends ProxiesState{}

class SuccessfullyFetchState extends ProxiesState{
  List<ProxyModel> proxies;

  SuccessfullyFetchState(this.proxies);
}

class SuccessfullyModifyState extends ProxiesState{
  ConfirmResponse response;
  List<ProxyModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends ProxiesState{
  String error;

  ErrorState(this.error);
}