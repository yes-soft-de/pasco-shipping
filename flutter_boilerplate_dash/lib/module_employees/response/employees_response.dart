
import 'package:pasco_shipping/utils/logger/logger.dart';


class EmployeeResponse {
  EmployeeResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<EmployeeModel>? data;

  EmployeeResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <EmployeeModel>[];
      try {
        data = List<EmployeeModel>.from(json['Data'].map((x) =>EmployeeModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}



class OneEmployeeResponse {
  OneEmployeeResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
 EmployeeModel? data;

  OneEmployeeResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      // data = <EmployeeModel>[];
      try {
        data =EmployeeModel.fromJson(json['Data']);
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class EmployeeModel {
  EmployeeModel({
    this.id,
    this.userName,
    this.UserID,
    this.email,
    this.phone,
    this.image,
    this.roles

    // this.createdAt,
    // this.updatedAt,
    // this.updatedByUser,
    // this.createdByUser
  });

  int? id;
  String? UserID;
  String? userName;
  String? email;
  String? phone;
  String? image;
  List<String>? roles;

  //
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // String? updatedByUser;
  // String? createdByUser;


  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json["id"] ??0,
    UserID: json["userID"]??'',
    userName: json["userName"]??'',
    email: json["email"]??'',
    phone: json["phone"]??'',
    image: json["image"]??'',
    roles: List<String>.from(json['roles'].map((x) =>x))


    // createdAt: DateTime.fromMillisecondsSinceEpoch(
    //     CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    // updatedAt: DateTime.fromMillisecondsSinceEpoch(
    //     CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    // updatedByUser: json['updatedByUser'],
    // createdByUser: json['createdByUser'],

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









