import 'package:pasco_shipping/utils/logger/logger.dart';

class TravelDetailsResponse {
  TravelDetailsResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  TravelDetailsModel? data;

  TravelDetailsResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = TravelDetailsModel();
      try {
        data = TravelDetailsModel.fromJson(json['Data']);
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class TravelDetailsModel {
  TravelDetailsModel({
    this.id,
    this.type,
    this.launchCountry,
    this.destinationCountry,
    this.travelNumber,
    this.status,
    this.subcontractName,

    this.launchDate ,
    this.arrivalDate ,

    this.createdAt,
    this.updatedAt,
    this.updatedByUser,

    this.holders
  });

  int? id;
  String? type;
  String? launchCountry;
  String? destinationCountry;

  String? travelNumber;
  String? status;
  String? subcontractName;

  DateTime? launchDate;
  DateTime? arrivalDate;


  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;

  List<HolderModel>? holders;

  factory TravelDetailsModel.fromJson(Map<String, dynamic> json) => TravelDetailsModel(
    id: json['id'],
    type: json['type'],

    launchCountry: json['launchCountry'],
    destinationCountry: json['destinationCountry'],

    travelNumber: json['travelNumber'],
    status: json['status'],
    subcontractName: json['subcontractName'],


    launchDate: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['launchDate']).timestamp! * 1000),
    arrivalDate: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['arrivalDate']).timestamp! * 1000),



    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    updatedByUser: json['createdByUser'],

    holders: List<HolderModel>.from(json["holders"].map((x) => HolderModel.fromJson(x))),

  );
}


class HolderModel {
  HolderModel({
    this.the0,
    this.id,
    this.shipmentId,
    this.trackNumber,
    this.travelId,
    this.holderType,
    this.holderId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  The0? the0;
  int? id;
  int? shipmentId;
  String? trackNumber;
  int? travelId;
  String? holderType;
  int? holderId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? createdBy;
  String? updatedBy;

  factory HolderModel.fromJson(Map<String, dynamic> json) => HolderModel(
    the0: The0.fromJson(json["0"]),
    id: json["id"],
    shipmentId: json["shipmentID"],
    trackNumber: json["trackNumber"],
    travelId: json["travelID"],
    holderType: json["holderType"],
    holderId: json["holderID"],
    createdAt:DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt:DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
  );


}
class The0 {
  The0({
    this.id,
    this.specificationId,
    this.containerNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.consigneeId,
    this.shipperId,
    this.type,
    this.providedBy,
    this.createdByUser,
    this.updatedByUser,

    this.capacityCpm,
    this.widthInMeter,
    this.hightInMeter,
    this.lengthInMeter,
    this.subcontractName,
    this.consigneeName,
    this.shipperName,
  });

  int? id;
  int? specificationId;
  String? containerNumber;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? createdBy;
  int? updatedBy;
  int? consigneeId;
  int? shipperId;
  String? type;
  int? providedBy;
  String? createdByUser;
  String? updatedByUser;
  int? capacityCpm;
  double? widthInMeter;
  int? hightInMeter;
  int? lengthInMeter;
  String? subcontractName;
  String? consigneeName;
  String? shipperName;

  factory The0.fromJson(Map<String, dynamic> json) => The0(
    id: json["id"],
    specificationId: json["specificationID"],
    containerNumber: json["containerNumber"] ?? json["airwaybillNumber"],
    status: json["status"],
    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
    CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    consigneeId: json["consigneeID"],
    shipperId: json["shipperID"],
    type: json["type"],
    providedBy: json["providedBy"],
    createdByUser: json["createdByUser"],
    updatedByUser: json["updatedByUser"],
    capacityCpm: json["capacityCPM"],
    widthInMeter: json["widthInMeter"],
    hightInMeter: json["hightInMeter"],
    lengthInMeter: json["lengthInMeter"],
    subcontractName: json["subcontractName"],
    consigneeName: json["consigneeName"],
    shipperName: json["shipperName"],
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