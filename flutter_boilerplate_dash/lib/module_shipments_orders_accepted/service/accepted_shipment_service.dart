
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/manager/accepted_shipment_manager.dart';
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
import 'package:pasco_shipping/module_shipments_orders_accepted/response/gunny_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/shipment_finance_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/warehouse_response.dart';

@injectable
class AcceptedShipmentService{
 final AcceptedShipmentManager _manager;
  AcceptedShipmentService(this._manager);

  Future<Data?> getAcceptedShipment(AcceptedShipmentFilterRequest type) {
    return _manager.getAcceptedShipment(type);
  }
 Future<List<AcceptedShipmentStatusModel>?> getAcceptedShipmentStatus(String type,String trackNumber) {
   return _manager.getAcceptedShipmentStatus(type,trackNumber);
 }
 Future<AcceptedShipmentDetailsModel?> getShipmentDetails(String id) {
   return _manager.getShipmentDetails(id);
 }
 Future<ConfirmResponse?> deliveredShipment(DeliveredRequest id) {
   return _manager.deliveredShipment(id);
 }
 Future<ConfirmResponse?> receivedShipment(ReceivedRequest id) {
   return _manager.receivedShipment(id);
 }
 Future<ConfirmResponse?> measuredShipment(MeasuredRequest id) {
   return _manager.measuredShipment(id);

 } Future<ConfirmResponse?> storedShipment(StoredRequest id) {
   return _manager.storedShipment(id);
 }
 Future<List<WarehouseModel>?> getWarehouse(String type) {
   return _manager.getWarehouse(type);
 }
 Future<List<GunnyShipmentModel>?> getGunnyShipment(String id ,track) {
   return _manager.getGunnyShipment(id,track);
 }

 Future<ConfirmResponse?> createShipmentFinance(ShipmentFinanceRequest request) {
   return _manager.createShipmentFinance(request);
 }
 Future<DataFinance?> getShipmentFinance(ShipmentFilterFinanceRequest request) {
   return _manager.getShipmentFinance(request);
 }
}