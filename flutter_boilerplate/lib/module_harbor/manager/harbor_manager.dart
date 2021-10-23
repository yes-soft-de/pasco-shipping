import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_harbor/repository/harbor_repository.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_filter_request.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_request.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';

@injectable
class HarborManager{
  final HarborRepository _repository;
  HarborManager(this._repository);
  Future<List<HarborModel>?> getHarbor(HarborFilterRequest request) => _repository.getHarbors(request);
}