import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';

class ReviewRequestShipmentState{}

class RequestShipmentInitState extends ReviewRequestShipmentState{}

class LoadingState extends ReviewRequestShipmentState{}

class SuccessfullyAddedShipment extends ReviewRequestShipmentState{
  SuccessfullyAddedShipment();
}

class errorState extends ReviewRequestShipmentState{
  String error;
  errorState(this.error);
}