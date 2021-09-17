
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_edit_shipment/manager/edit_shipment_manager.dart';
import 'package:pasco_shipping/module_edit_shipment/request/update_shipment_request.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class EditShipmentService {
  final EditShipmentManager _manager;
  EditShipmentService(this._manager);

  Future<ConfirmResponse> updateShipment(UpdateShipmentRequest request) {
    return _manager.updateShipment(request);
  }
}