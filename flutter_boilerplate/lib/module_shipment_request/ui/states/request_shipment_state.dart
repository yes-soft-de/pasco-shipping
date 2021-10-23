import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_receiver/response/receiver_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
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
  List<Mark> marks;
  List<UnitModel> units;

  List<HarborModel> harbors;
  List<SubcontractModel> subContracts;
  List<dynamic> specifications;

  SecondOptionFetchingDataState({required this.marks ,required this.units ,required this.specifications ,required this.harbors ,required this.subContracts});
}
class ThirdOptionFetchingDataState extends RequestShipmentState{
  List<ReceiverModel> receivers;
  ThirdOptionFetchingDataState(this.receivers);
}
class errorState extends RequestShipmentState{
  String error;
  errorState(this.error);
}