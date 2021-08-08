import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';

class WaitingShipmentsState{}


class LoadingState extends WaitingShipmentsState{}

class SuccessfullyFetchState extends WaitingShipmentsState{
  List<WaitingShipmentModel> waitingShipments;

  SuccessfullyFetchState(this.waitingShipments);
}

class ErrorState extends WaitingShipmentsState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}