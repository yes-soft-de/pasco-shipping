import 'package:pasco_shipping/utils/logger/logger.dart';

class StoredResponse {
  StoredResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  StoredModel? data;

  StoredResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = StoredModel(remainedQuantity: '');
      try {
        data = StoredModel.fromJson(json['Data']);
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class StoredModel {
  StoredModel({
   required this.remainedQuantity,
    // this.completedStored,
  });


  String remainedQuantity;
  // bool? completedStored;


  factory StoredModel.fromJson(Map<String, dynamic> json) => StoredModel(
    remainedQuantity: json['remainedQuantity'].toString(),
    // completedStored: json['completedStored'] ?? false,

  );
}