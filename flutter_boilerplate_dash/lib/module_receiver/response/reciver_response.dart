import 'package:pasco_shipping/utils/logger/logger.dart';

class ReceiverResponse {
  String? statusCode;
  String? msg;
  List<ReceiverModel>? data;

  ReceiverResponse({this.statusCode, this.msg, this.data});

  ReceiverResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <ReceiverModel>[];
      try {
        data = List<ReceiverModel>.from(json['Data'].map((x) => ReceiverModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}
class ReceiverModel {
  ReceiverModel({
     this.id,
     this.fullName,
     this.phone,
    this.clientUsername,
    this.email,
    this.address
  });

  int? id;
  String? fullName;
  String? phone;
  String? email;
  String? address;
  String? clientUsername;

  factory ReceiverModel.fromJson(Map<String, dynamic> json) => ReceiverModel(
    id: json['id'],
    fullName: json['fullName'],
    phone: json['phone'],
    email: json['email'],
    address: json['address'],
    clientUsername: json['clientUsername'],
  );

}