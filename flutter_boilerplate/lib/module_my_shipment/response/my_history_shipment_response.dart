class MyHistoryShipmentResponse {
  MyHistoryShipmentResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<MyHistoryShipment>? data;

  factory MyHistoryShipmentResponse.fromJson(Map<String, dynamic> json) =>
      MyHistoryShipmentResponse(
        statusCode: json["status_code"],
        msg: json["msg"],
        data: List<MyHistoryShipment>.from(
            json["Data"].map((x) => MyHistoryShipment.fromJson(x))),
      );
}

class MyHistoryShipment {
  MyHistoryShipment({
    this.shipmentId,
    this.trackNumber,
    this.statusDetails,
    this.target,
    this.supplierName,
    this.distributorName,
    this.exportWarehouseName,
    this.importWarehouseName,
    this.quantity,
    this.updatedAt,
    this.productCategoryName,
    this.unit,
    this.receiverName,
    this.receiverPhoneNumber,
    this.paymentTime,
    this.vehicleIdentificationNumber,
    this.extraSpecification,
    this.transportationType,
    this.markNumber,
    this.imagePath
  });

  int? shipmentId;
  String? trackNumber;
  String? statusDetails;

  String? target;

  String? supplierName;
  String? distributorName;
  String? exportWarehouseName;
  String? importWarehouseName;
  int? quantity;
  DateTime? updatedAt;
  String? productCategoryName;
  String? unit;
  String? receiverName;
  String? receiverPhoneNumber;

  String? paymentTime;

  String? transportationType;
  String? markNumber;

  String? vehicleIdentificationNumber;
  String? extraSpecification;

  String? imagePath;

  factory MyHistoryShipment.fromJson(Map<String, dynamic> json) =>
      MyHistoryShipment(
        shipmentId: json["shipmentID"],
        trackNumber: json["trackNumber"],
        statusDetails: json["statusDetails"],
        target: json["target"],
        supplierName: json["supplierName"],
        distributorName: json["distributorName"],
        exportWarehouseName: json["exportWarehouseName"],
        importWarehouseName: json["importWarehouseName"],
        quantity: json["quantity"],
        updatedAt: DateTime.fromMillisecondsSinceEpoch(
            CreatedAt.fromJson(json["updatedAt"]).timestamp! * 1000),
        productCategoryName: json["productCategoryName"],
        unit: json["unit"],
        receiverName: json["receiverName"],
        receiverPhoneNumber: json["receiverPhoneNumber"],
        paymentTime: json["paymentTime"],
        vehicleIdentificationNumber: json["vehicleIdentificationNumber"],
        extraSpecification: json["extraSpecification"],

        transportationType : json['transportationType'],
        markNumber: json['markNumber'],
        imagePath:json['image'],
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
