import 'package:pasco_shipping/module_shipments_orders_accepted/enums/accepted_shipment_status.dart';
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
    shipmentStatus =addDesriptionToStatus( json['shipmentStatus']);
    createdByUser = json['createdByUser'];
    statusDetails = json['statusDetails'] ??'';
    isPassed = json['isPassed'] ?? false;

    createdAt = json['createdAt'] == null
        ? DateTime.now()
        : DateTime.fromMillisecondsSinceEpoch(
            CreatedAt.fromJson(json['createdAt']).timestamp! * 1000);
  }


  String addDesriptionToStatus(String status){
    if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.ACCEPTED]!) {
      return 'Shipment accepted successfully';
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.RECEIVED]!){
      return 'The shipment was received from the customer in the warehouse';}
      else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.MEASURED]!){
        return 'The packaging and measurement phase has been completed';
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.STORED]!){
        return 'The shipment was loaded into a container';
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.UPLOADED]!){
      return 'The shipment was loaded into a travel';
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.STARTED]!){
      return 'The travel has started';
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.RELEASED]!){
      return 'The travel has arrived the destination country';
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.CLEARED]!){
      return 'The container has cleared';
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.ARRIVED]!){
      return 'The shipment has arrived to warehouse';
    }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.DELIVERED]!){
      return 'The shipment has been delivered to the client';
      }else if(status == AcceptedShipmentStatusName[AcceptedShipmentStatus.WAITING]!){
      return 'Shipment waiting for acceptance';
    }
      else {
      return '';
    }
}}

class CreatedAt {
  CreatedAt({
    this.timestamp,
  });
  int? timestamp;

  factory CreatedAt.fromJson(Map<String, dynamic> json) => CreatedAt(
        timestamp: json["timestamp"],
      );
}
