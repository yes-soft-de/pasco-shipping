import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_my_shipment/repository/my_shipment_repository.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_active_shipment_response.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_history_shipment_response.dart';

@injectable
class MyShipmentManager{
  final MyShipmentRepository _repository;
  MyShipmentManager(this._repository);

  Future<List<MyShipment>?> getMyActiveShipment() => _repository.getMyActiveShipment();
  Future<List<MyHistoryShipment>?> getMyDeliveredShipment() => _repository.getMyDeliveredShipment();

}