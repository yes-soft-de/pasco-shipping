import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
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
  List<ClientModel> marks;
  SecondOptionFetchingDataState(this.marks);
}
class ThirdOptionFetchingDataState extends RequestShipmentState{
  List<DistributorModel> distributors;
  List<Mark> clients;
  ThirdOptionFetchingDataState(this.distributors , this.clients);
}
class errorState extends RequestShipmentState{
  String error;
  errorState(this.error);
}