import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';

class RequestShipmentState{}

class RequestShipmentInitState extends RequestShipmentState{}

class LoadingState extends RequestShipmentState{}

class FirstOptionFetchingDataState extends RequestShipmentState{
  List<Category> categories;
  List<Countries> warehouses;

  FirstOptionFetchingDataState({required this.warehouses,required this.categories});
}

class SecondOptionFetchingDataState extends RequestShipmentState{
  List<Mark> marks;
  SecondOptionFetchingDataState(this.marks);
}

class errorState extends RequestShipmentState{
  String error;
  errorState(this.error);
}