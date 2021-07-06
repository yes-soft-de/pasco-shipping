
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_edit_shipment/manager/edit_shipment_manager.dart';
import 'package:pasco_shipping/module_edit_shipment/request/add_shipment_request.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class EditShipmentService {
  final EditShipmentManager _manager;
  EditShipmentService(this._manager);

  Future<ConfirmResponse> addNewShipment(AddShipmentRequest request) {
    return _manager.createShipment(request);
  }
}