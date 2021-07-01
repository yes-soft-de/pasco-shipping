import 'package:pasco_shipping/utils/logger/logger.dart';

class TrackResponse {
  String? statusCode;
  String? msg;
  TrackModel? data;

  TrackResponse({this.statusCode, this.msg, this.data});

  TrackResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      try {
        data = TrackModel.fromJson(json['Data']);
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }
}

class TrackModel {
  TrackModel(
      {this.shipmentStatus,
      this.statusDetails,
      this.isInOneHolder,
      this.packed,
      this.distributorName,
      this.importWarehouseName,
      this.quantity,
      this.orderCreationDate,
      this.orderUpdatingDate,
      this.productCategoryName,
      this.packetingBy,
      this.weight,
      this.qrCode,
      this.guniQuantity,
      this.tracks});

  String? shipmentStatus;
  String? statusDetails;
  bool? isInOneHolder;
  bool? packed;
  String? distributorName;
  String? importWarehouseName;
  int? quantity;
  DateTime? orderCreationDate;
  DateTime? orderUpdatingDate;
  String? productCategoryName;
  String? packetingBy;
  double? weight;
  String? qrCode;
  int? guniQuantity;
  List<Track>? tracks;

  factory TrackModel.fromJson(Map<String, dynamic> json) => TrackModel(
        shipmentStatus: json["shipmentStatus"],
        statusDetails: json["statusDetails"],
        isInOneHolder: json["isInOneHolder"],
        packed: json["packed"],
        distributorName: json["distributorName"],
        importWarehouseName: json["importWarehouseName"],
        quantity: json["quantity"],
        orderCreationDate: DateTime.fromMillisecondsSinceEpoch(
            OrderDate.fromJson(json['orderCreationDate']).timestamp! * 1000),
        orderUpdatingDate: DateTime.fromMillisecondsSinceEpoch(
            OrderDate.fromJson(json["orderUpdatingDate"]).timestamp! * 1000),
        productCategoryName: json["productCategoryName"],
        packetingBy: json["packetingBy"],
        weight: json["weight"],
        qrCode: json["qrCode"],
        guniQuantity: json["guniQuantity"],
        tracks: List<Track>.from(json['tracks'].map((x) => Track.fromJson(x))),
      );
}

class OrderDate {
  OrderDate({
    this.timestamp,
  });

  int? timestamp;

  factory OrderDate.fromJson(Map<String, dynamic> json) => OrderDate(
        // timezone: Timezone.fromJson(json["timezone"]),
        // offset: json["offset"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        // "timezone": timezone.toJson(),
        // "offset": offset,
        "timestamp": timestamp,
      };
}

class HolderInfo {
  String? status;
  String? identificationNumber;

  HolderInfo({this.status, this.identificationNumber});

  factory HolderInfo.fromJson(Map<String, dynamic> json) => HolderInfo(
        status: json['status'],
        identificationNumber: json['identificationNumber'],
      );
}

class Track {
  Track({
    this.id,
    this.holderType,
    this.holderInfo,
  });

  int? id;
  String? holderType;
  HolderInfo? holderInfo;

  Track.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    holderType = json['holderType'];
    try {
      holderInfo = HolderInfo.fromJson(json['holderInfo']);
    } catch (_) {}
  }
}
