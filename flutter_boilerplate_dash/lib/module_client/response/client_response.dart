
import 'package:pasco_shipping/utils/logger/logger.dart';


class ClientResponse {
  ClientResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<ClientModel>? data;

  ClientResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <ClientModel>[];
      try {
        data = List<ClientModel>.from(json['Data'].map((x) => ClientModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class ClientModel {
  ClientModel({
    this.id,
    this.userID,
    this.userName,
    this.image,
    this.city,
    this.location,
    this.phone,
    this.country,
this.marks,

    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? id;
  String? userID;
  String? userName;
  String? image;
  String? city;
  String? country;
  String? location;
  String? phone;
  List<MarkNumber>? marks;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


   ClientModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        userName= json['userName'];
        userID= json['userID'];
        location= json['location'];
        country= json['country'];
        city= json['city'];
        phone= json['phone'];
        image=json['image'];
       if(json['marks'] != null){
        marks = List<MarkNumber>.from(json['marks'].map((x) => MarkNumber.fromJson(x)));
       }else{
        marks= [];
       }



    createdAt= DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createAt'] ?? 0).timestamp! * 1000);
    updatedAt=DateTime.now();
    // DateTime.fromMillisecondsSinceEpoch(
    //     CreatedAt.fromJson(json['updatedAt'] ?? 0).timestamp! * 1000),
    createdByUser= json['createdByUser'];
    updatedByUser= json['updatedByUser'];
  }

}
class MarkNumber{
  MarkNumber({this.markNumber});
  String? markNumber;
  factory MarkNumber.fromJson(Map<String, dynamic> json) => MarkNumber(
    markNumber: json['markNumber'],
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









