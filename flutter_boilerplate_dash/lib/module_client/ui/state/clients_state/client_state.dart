import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class ClientsState{}


class LoadingState extends ClientsState{}

class SuccessfullyFetchState extends ClientsState{
  List<ClientModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

// class SuccessfullyModifyState extends ClientsState{
//   ConfirmResponse response;
//   List<ClientModel> proxies;
//
//   SuccessfullyModifyState(this.response, this.proxies);
// }

class ErrorState extends ClientsState{
  String error;

  ErrorState(this.error);
}