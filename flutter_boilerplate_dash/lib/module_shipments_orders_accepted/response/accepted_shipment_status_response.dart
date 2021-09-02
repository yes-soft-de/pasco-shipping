import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
import 'package:pasco_shipping/utils/helpers/status_code_helper.dart';
import 'package:pasco_shipping/utils/logger/logger.dart';

class AcceptedShipmentStatusResponse {
  AcceptedShipmentStatusResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<AcceptedShipmentStatusModel>? data;

  AcceptedShipmentStatusResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <AcceptedShipmentStatusModel>[];
      try {
        data = List<AcceptedShipmentStatusModel>.from(
            json['Data'].map((x) => AcceptedShipmentStatusModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }
}

class AcceptedShipmentStatusModel {
  AcceptedShipmentStatusModel({
    this.shipmentId,
    this.createdAt,
    this.shipmentStatus,
    this.statusDetails,
    required this.isPassed,
    this.createdByUser,
    this.id,
  });

  int? id;
  int? shipmentId;

  String? shipmentStatus;
  String? statusDetails;
  String? createdByUser;
  DateTime? createdAt;
  late bool isPassed;

  AcceptedShipmentStatusModel.fromJson(Map<String, dynamic> json) {
    shipmentId = json['shipmentID'];
    id = json['id'];
    shipmentStatus =StatusCodeHelper.addDesriptionToStatus( json['shipmentStatus']);
    createdByUser = json['createdByUser'];
    statusDetails = json['statusDetails'] ??'';
    isPassed = json['isPassed'] ?? false;

    createdAt = json['createdAt'] == null
        ? DateTime.now()
        : DateTime.fromMillisecondsSinceEpoch(
            CreatedAt.fromJson(json['createdAt']).timestamp! * 1000);
  }



}

class CreatedAt {
  CreatedAt({
    this.timestamp,
  });
  int? timestamp;

  factory CreatedAt.fromJson(Map<String, dynamic> json) => CreatedAt(
        timestamp: json["timestamp"],
      );
}
