import 'package:pasco_shipping/utils/logger/logger.dart';

class MarkResponse {
  String? statusCode;
  String? msg;
  List<Mark>? data;

  MarkResponse({this.statusCode, this.msg, this.data});

  MarkResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <Mark>[];
      try {
        data = List<Mark>.from(json['Data'].map((x) => Mark.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}
class Mark {
  Mark({
     this.id,
     this.markNumber,
     this.used,
  });

  int? id;
  String? markNumber;
  bool? used;

  factory Mark.fromJson(Map<String, dynamic> json) => Mark(
    id: json['id'],
    markNumber: json['markNumber'],
    used: json['used'],
  );

}