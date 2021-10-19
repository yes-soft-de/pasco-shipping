
import 'package:pasco_shipping/utils/logger/logger.dart';

class ContainerPriceResponse {
  ContainerPriceResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<ContainerPriceModel>? data;

  ContainerPriceResponse.fromJson(Map<String, dynamic> json) {
    statusCode =  json['status_code'];
    msg= json['msg'];
    try {
      data= List<ContainerPriceModel>.from(json['Data'].map((x) => ContainerPriceModel.fromJson(x)));
    } catch (e, stack) {
      Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
          StackTrace.current);
    }
  }}

class ContainerPriceModel {
  ContainerPriceModel({
    this.id,
    this.exportCity,
    this.price,
    this.exportCountryName,
    this.containerSpecificationName,
    this.destinationPortName

  });

  int? id;
  String? containerSpecificationName;
  String? exportCountryName;
  String? exportCity;
  String? destinationPortName;
  String? price;



  ContainerPriceModel.fromJson(Map<String, dynamic> json) {
    try{
      id =json['id'];
      exportCountryName = json['exportCountryName'];
      exportCity = json['exportCity'];
      containerSpecificationName= json['containerSpecificationName'];
      destinationPortName= json['destinationPortName'];
      price= json['price'].toString();
    } catch (e, stack) {
      Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
          StackTrace.current);
    }

  }
}