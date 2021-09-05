
import 'package:pasco_shipping/utils/logger/logger.dart';


class TravelResponse {
  TravelResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<TravelModel>? data;

  TravelResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <TravelModel>[];
      try {
        data = List<TravelModel>.from(json['Data'].map((x) => TravelModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class TravelModel {
  TravelModel({
    this.id,
    this.type,
    this.launchCountry,
    this.destinationCountry,
    this.travelNumber,
    this.status,
    this.subcontractName,
    this.carrierName,

    this.launchDate ,
    this.arrivalDate ,

    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? id;
  String? type;
  String? launchCountry;
  String? destinationCountry;

  String? travelNumber;
  String? status;
  String? subcontractName;
  String? carrierName;

  DateTime? launchDate;
  DateTime? arrivalDate;


  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory TravelModel.fromJson(Map<String, dynamic> json) => TravelModel(
    id: json['id'],
    type: json['type'],

    launchCountry: json['launchCountry'],
    destinationCountry: json['destinationCountry'],

    travelNumber: json['travelNumber'],
    status: json['status'],
    subcontractName: json['subcontractName'],
    carrierName: json['carrierName'],


    launchDate: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['launchDate']).timestamp! * 1000),
    arrivalDate: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['arrivalDate']).timestamp! * 1000),



    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    updatedByUser: json['updatedByUser'],
    createdByUser: json['createdByUser'],

  );
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









