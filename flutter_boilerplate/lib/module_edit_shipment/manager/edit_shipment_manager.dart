import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_edit_shipment/repository/edit_shipment_repository.dart';
import 'package:pasco_shipping/module_edit_shipment/request/add_shipment_request.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class EditShipmentManager{
  final EditShipmentRepository _repository;
  EditShipmentManager(this._repository);

  Future<ConfirmResponse> createShipment(AddShipmentRequest request) => _repository.addNewShipment(request);

}