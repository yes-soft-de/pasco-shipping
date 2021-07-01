import 'package:pasco_shipping/module_my_shipment/response/my_active_shipment_response.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_history_shipment_response.dart';

class MyShipmentState{}

class MyShipmentInitState extends MyShipmentState{}

class LoadingMyShipmentState extends MyShipmentState{}

class SuccessfullyFetchActiveShipmentState extends MyShipmentState{
  List<MyShipment> shipments;

  SuccessfullyFetchActiveShipmentState(this.shipments);
}
class SuccessfullyFetchHistoryShipmentState extends MyShipmentState{
  List<MyHistoryShipment> shipments;

  SuccessfullyFetchHistoryShipmentState(this.shipments);
}
class ErrorFetchingDataState extends MyShipmentState{
  String msg;

  ErrorFetchingDataState(this.msg);
}