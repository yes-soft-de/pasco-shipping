import 'package:pasco_shipping/utils/logger/logger.dart';

class GunnyShipmentResponse {
  GunnyShipmentResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<GunnyShipmentModel>? data;

  GunnyShipmentResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <GunnyShipmentModel>[];
      try {
        data = List<GunnyShipmentModel>.from(json['Data'].map((x) => GunnyShipmentModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}


class GunnyShipmentModel {
  int id;
  String? gunnyIdentificationNumber;
  int? quantity;

  GunnyShipmentModel({required this.id , this.gunnyIdentificationNumber ,this.quantity});
  factory GunnyShipmentModel.fromJson(Map<String, dynamic> json) =>
      GunnyShipmentModel(
          id: json['id'],
          gunnyIdentificationNumber :  json['gunnyIdentificationNumber'],
          quantity: json['quantity']
      );
}