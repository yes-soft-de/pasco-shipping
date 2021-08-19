
import 'package:pasco_shipping/utils/logger/logger.dart';

class MyShipmentResponse {
  MyShipmentResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<MyShipment>? data;

  MyShipmentResponse.fromJson(Map<String, dynamic> json) {
    try {
      statusCode = json['status_code'];
      msg = json['msg'];
      if (json['Data'] != null) {
        data =
        List<MyShipment>.from(json['Data'].map((x) => MyShipment.fromJson(x)));
      }
    }catch (e) {
      Logger()
          .error('ActiveShipment Response', e.toString(), StackTrace.current);
      statusCode = '-1';
    }

  }

}

class MyShipment {
  MyShipment({
    this.id,
    this.trackNumber,
    this.shipmentStatus,
    this.productCategoryName,
  });

  int? id;
  int? shipmentId;
  String? trackNumber;
  String? shipmentStatus;
  String? productCategoryName;
  factory MyShipment.fromJson(Map<String, dynamic> json) => MyShipment(
    id: json['id'],
    trackNumber: json['trackNumber'],
    shipmentStatus: json['shipmentStatus'] ?? json['status'],
    productCategoryName: json['productCategoryName'],
  );

}

class CreatedAt {
  CreatedAt({
    this.timestamp,
  });

  int? timestamp;

  factory CreatedAt.fromJson(Map<String, dynamic> json) => CreatedAt(
    timestamp: json['timestamp'],
  );
}
