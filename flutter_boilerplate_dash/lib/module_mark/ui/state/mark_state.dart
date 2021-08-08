import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';

class MarkState{}

class MarkFirstState extends MarkState{
  List<ClientModel> clients;

  MarkFirstState(this.clients);
}

class LoadingMarkState extends MarkState{}

class SuccessfullyFetchMarkState extends MarkState{
  List<Mark> marks;
  List<ClientModel> clients;
  Entry optionItem;

  SuccessfullyFetchMarkState(this.marks , this.clients ,this.optionItem);
}

class SuccessfullyModifyMarkState extends MarkState{
  ConfirmResponse response;
  List<Mark> marks;
  Entry optionItem;
  SuccessfullyModifyMarkState(this.response, this.marks , this.optionItem);
}

// class FailModifyMark extends MarkState{
//   ConfirmResponse response;
//
//   FailModifyMark(this.response);
// }

class ErrorMarkState extends MarkState{
  String error;

  ErrorMarkState(this.error);
}