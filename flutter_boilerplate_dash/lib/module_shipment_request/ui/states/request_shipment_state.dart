import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/specefication/specefication.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';

class RequestShipmentState{}

class RequestShipmentInitState extends RequestShipmentState{}

class LoadingState extends RequestShipmentState{}

class FirstOptionFetchingDataState extends RequestShipmentState{
  List<ProductModel> categories;
  List<Countries> warehouses;

  FirstOptionFetchingDataState({required this.warehouses,required this.categories});
}

class SecondOptionFetchingDataState extends RequestShipmentState{
  List<ClientModel> marks;
  List<UnitModel> units;
  List<dynamic> specifications;
  SecondOptionFetchingDataState(this.marks , this.units , this.specifications);
}
// class SecondOptionFetchingDataAirState extends RequestShipmentState{
//   List<ClientModel> marks;
//   List<UnitModel> units;
//   List<AirwaybillSpecificationModel> airwaybillSpecification;
//
//   SecondOptionFetchingDataAirState(this.marks , this.units ,this.airwaybillSpecification);
// }
class ThirdOptionFetchingDataState extends RequestShipmentState{
  List<DistributorModel> distributors;
  List<Mark> marks;
  List<ReceiverModel> receivers;
  ThirdOptionFetchingDataState(this.distributors , this.marks ,this.receivers);
}
class errorState extends RequestShipmentState{
  String error;
  errorState(this.error);
}