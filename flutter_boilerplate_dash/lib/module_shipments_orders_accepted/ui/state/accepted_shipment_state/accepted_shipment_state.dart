import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';

class AcceptedShipmentsState{}


class LoadingState extends AcceptedShipmentsState{}

class SuccessfullyFetchState extends AcceptedShipmentsState{
  List<AcceptedShipmentModel> waitingShipments;

  SuccessfullyFetchState(this.waitingShipments);
}

class ErrorState extends AcceptedShipmentsState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}