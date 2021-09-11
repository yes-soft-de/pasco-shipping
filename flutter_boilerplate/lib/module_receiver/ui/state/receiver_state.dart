import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_receiver/response/receiver_response.dart';

class ReceiverState{}

class MarkInitState extends ReceiverState{}

class LoadingMarkState extends ReceiverState{}

class SuccessfullyFetchMarkState extends ReceiverState{
  List<ReceiverModel> marks;

  SuccessfullyFetchMarkState(this.marks);
}

class SuccessfullyModifyMarkState extends ReceiverState{
  ConfirmResponse response;
  List<ReceiverModel> marks;

  SuccessfullyModifyMarkState(this.response, this.marks);
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