import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/repository/waiting_shipment_repository.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/request/accepted_rejected_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';

@injectable
class WaitingShipmentManager{
  final WaitingShipmentRepository _repository;
  WaitingShipmentManager(this._repository);

  Future<List<WaitingShipmentModel>?> getWaitingShipment(String transportationType) => _repository.getWaitingShipment(transportationType);
  Future<ConfirmResponse?> acceptedOrRejected(AcceptedOrRejectedRequest request) => _repository.acceptedOrRejectedShipment(request);

}