import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';

class MarkState{}

class MarkInitState extends MarkState{}

class LoadingMarkState extends MarkState{}

class SuccessfullyFetchMarkState extends MarkState{
  List<Mark> marks;

  SuccessfullyFetchMarkState(this.marks);
}

class SuccessfullyModifyMarkState extends MarkState{
  ConfirmResponse response;
  List<Mark> marks;

  SuccessfullyModifyMarkState(this.response, this.marks);
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