import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_gunny/repository/gunny_repo.dart';
import 'package:pasco_shipping/module_gunny/request/add_shipment_to_gunny_request.dart';
import 'package:pasco_shipping/module_gunny/response/gunny_response.dart';
import 'package:pasco_shipping/module_gunny/response/stored_response.dart';

@injectable
class GunnyManager{
  final GunnyRepository _repository;
  GunnyManager(this._repository);

  Future<List<GunnyModel>?> createGunny() => _repository.createGunny();

  Future<List<GunnyModel>?> getGunnies() => _repository.getGunny();

  Future<StoredModel?> addShipmentToGunny(AddShipmentToGunnyRequest request) => _repository.addShipmentToGunny(request);


}