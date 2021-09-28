import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/repository/accepted_shipment_repository.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/deliered_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/measured_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/receiver_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipemnt_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/stored_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/shipment_finance_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/warehouse_response.dart';

@injectable
class AcceptedShipmentManager{
  final AcceptedShipmentRepository _repository;
  AcceptedShipmentManager(this._repository);

  Future<Data?> getAcceptedShipment(AcceptedShipmentFilterRequest transportationType) => _repository.getAcceptedShipment(transportationType);
  Future<List<AcceptedShipmentStatusModel>?> getAcceptedShipmentStatus(String id,String trackNumber) => _repository.getAcceptedShipmentStatus(id,trackNumber);
  Future<List<WarehouseModel>?> getWarehouse(String cityName) => _repository.getWarehouses(cityName);
  Future<AcceptedShipmentDetailsModel?> getShipmentDetails(String id) => _repository.getShipmentDetails(id);
  Future<ConfirmResponse?> deliveredShipment(DeliveredRequest id) => _repository.deliverdShipment(id);
  Future<ConfirmResponse?> receivedShipment(ReceivedRequest id) => _repository.receivedShipment(id);
  Future<ConfirmResponse?> measuredShipment(MeasuredRequest request) => _repository.measuredShipment(request);
  Future<ConfirmResponse?> storedShipment(StoredRequest request) => _repository.storedShipment(request);

  Future<ConfirmResponse?> createShipmentFinance(ShipmentFinanceRequest request) => _repository.createShipmentFinance(request);
  // Future<ConfirmResponse?> deleteProxy(String id) => _repository.deleteProxy(id);
  Future<DataFinance?> getShipmentFinance(ShipmentFilterFinanceRequest request) => _repository.getShipmentFinance(request);
// Future<ConfirmResponse?> updateProxy(ProxyRequest request) => _repository.updateProxy(request);

}