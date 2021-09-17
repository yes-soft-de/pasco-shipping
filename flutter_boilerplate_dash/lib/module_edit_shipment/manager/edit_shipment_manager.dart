import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_edit_shipment/repository/edit_shipment_repository.dart';
import 'package:pasco_shipping/module_edit_shipment/request/update_shipment_request.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class EditShipmentManager{
  final EditShipmentRepository _repository;
  EditShipmentManager(this._repository);

  Future<ConfirmResponse> updateShipment(UpdateShipmentRequest request) => _repository.updateShipment(request);

}