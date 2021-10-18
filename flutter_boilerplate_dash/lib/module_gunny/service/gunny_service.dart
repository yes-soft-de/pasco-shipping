import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_gunny/manager/gunny_manager.dart';
import 'package:pasco_shipping/module_gunny/request/add_shipment_to_gunny_request.dart';
import 'package:pasco_shipping/module_gunny/response/gunny_response.dart';
import 'package:pasco_shipping/module_gunny/response/stored_response.dart';

@injectable
class GunnyService {
  final GunnyManager _manager;
  GunnyService(this._manager);

  Future< List<GunnyModel>?> createGunny() {
    return _manager.createGunny();
  }  Future< ConfirmResponse?> deleteGunny(id) {
    return _manager.deleteGunny(id);
  }
  Future<StoredModel?> addShipmentToGunny(AddShipmentToGunnyRequest request) {
    return _manager.addShipmentToGunny(request);
  }

  Future<List<GunnyModel>?> getGunnies() {
    return _manager.getGunnies();
  }
}