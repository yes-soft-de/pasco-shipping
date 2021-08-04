import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/repository/accepted_shipment_repository.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';

@injectable
class AcceptedShipmentManager{
  final AcceptedShipmentRepository _repository;
  AcceptedShipmentManager(this._repository);

  Future<List<AcceptedShipmentModel>?> getAcceptedShipment(AcceptedShipmentFilterRequest transportationType) => _repository.getAcceptedShipment(transportationType);
  Future<AcceptedShipmentDetailsModel?> getShipmentDetails(String id) => _repository.getShipmentDetails(id);


}