
class MyShipmentResponse {
  MyShipmentResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<MyShipment>? data;

  factory MyShipmentResponse.fromJson(Map<String, dynamic> json) => MyShipmentResponse(
    statusCode: json['status_code'],
    msg: json['msg'],
    data: List<MyShipment>.from(json['Data'].map((x) => MyShipment.fromJson(x))),
  );
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
