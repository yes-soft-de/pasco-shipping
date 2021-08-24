import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';

class ReceiverState{}

class MarkFirstState extends ReceiverState{
  List<ClientModel> clients;

  MarkFirstState(this.clients);
}

class LoadingMarkState extends ReceiverState{}

class SuccessfullyFetchReceiverState extends ReceiverState{
  List<ReceiverModel> receivers;
  List<ClientModel> clients;
  Entry optionItem;

  SuccessfullyFetchReceiverState(this.receivers , this.clients ,this.optionItem);
}

class SuccessfullyModifyMarkState extends ReceiverState{
  ConfirmResponse response;
  List<ReceiverModel> receivers;
  Entry optionItem;
  SuccessfullyModifyMarkState(this.response, this.receivers , this.optionItem);
}

// class FailModifyMark extends MarkState{
//   ConfirmResponse response;
//
//   FailModifyMark(this.response);
// }

class ErrorMarkState extends ReceiverState{
  String error;

  ErrorMarkState(this.error);
}