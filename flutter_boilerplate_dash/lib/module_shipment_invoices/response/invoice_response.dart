import 'package:pasco_shipping/utils/logger/logger.dart';

class InvoiceResponse {
  InvoiceResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<InvoiceModel>? data;

  InvoiceResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <InvoiceModel>[];
      try {
        data = List<InvoiceModel>.from(json['Data'].map((x) => InvoiceModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class InvoiceModel {
  InvoiceModel({
   required this.id ,
   required this.clientUserID,
    this.clientUserName,
    this.shipmentID,
    this.notes,
    this.paidByClient,
    this.paidOnBehalfBy,
    this.paymentDate,
    this.totalCost,
    this.finalAmount,
    this.invoiceImage,
    this.receiptImage,
    this.paymentStatus,
    this.discount,
   required this.billingDetails,

    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser,
  });

  int id  = 0;
  String? clientUserID ;
  String? clientUserName ;
  int? shipmentID;
  String? paidByClient;
  String? paymentStatus;

  String? paidOnBehalfBy;
  String? invoiceImage;
  String? receiptImage;
  String? totalCost;
  String? finalAmount;
  int? discount;
  String? notes;

  String? clientPhone;
  String? clientLocation;
  String? clientCity;
  String? clientCountry;
  String? clientIdentificationNumber;
  String? transportationType;
  String? target;
  String? paymentTime;


  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? paymentDate;
  String? updatedByUser;
  String? createdByUser;
  List<BillingDetails> billingDetails =[];

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    id= json['id'] ;
    shipmentID= json['shipmentID'];
    clientUserID= json["clientUserID"]??'';
    clientUserName= json["clientUserName"]??'';
    finalAmount= json["finalAmount"].toString() =='null' ? '0' : json["finalAmount"].toString();

    paidByClient= json['paidBy'] != null ? json["clientUserName"] :'';
    paymentStatus= json['paymentStatus'];

    paidOnBehalfBy= json['paidOnBehalfBy'];
    invoiceImage= json['invoiceImage'] ??'';
    receiptImage= json['receiptImage'] ??'';
    totalCost= json['totalCost'].toString() =='null' ? '0': json['totalCost'].toString();
    discount= json['discount']??0;
    notes= json['notes'];

    clientPhone =json['clientPhone'] ??'';
    clientLocation =json['clientLocation']??'';
    clientCity =json['clientCity']??'';
    clientCountry =json['clientCountry']??'';
    clientIdentificationNumber =json['clientIdentificationNumber'];
    transportationType =json['transportationType'];
    target =json['target']??'';
    paymentTime =json['paymentTime']??'';


    if(json['billDetails'] != null){
    billingDetails=
    List<BillingDetails>.from(json['billDetails'].map((x) => BillingDetails.fromJson(x)));
    }

    paymentDate= json['paymentDate'] == null? DateTime(0):
    DateTime.fromMillisecondsSinceEpoch(
    CreatedAt.fromJson(json['paymentDate']).timestamp! * 1000);

    createdAt= DateTime.fromMillisecondsSinceEpoch(
    CreatedAt.fromJson(json['createdAt']).timestamp! * 1000);
    updatedAt= DateTime.fromMillisecondsSinceEpoch(
    CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000);
    updatedByUser= json['updatedByUser'];
    createdByUser= json['createdByUser'];
  }


}


class BillingDetails {
  BillingDetails({
    this.shipmentStatus,
    this.stageCost,
    this.stageDescription,
  });


  String? shipmentStatus;
  int? stageCost;
  String? stageDescription;


  factory BillingDetails.fromJson(Map<String, dynamic> json) => BillingDetails(
    stageCost: json['stageCost'],
    shipmentStatus: json['shipmentStatus'],
    stageDescription: json['stageDescription'],
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