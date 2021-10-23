import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_harbor/manager/harbor_manager.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_filter_request.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_request.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';


@injectable
  class HarborService {
  final HarborManager _manager;
  HarborService(this._manager);

  Future<List<HarborModel>?> getHarbor(HarborFilterRequest request) {
    return _manager.getHarbor(request);
  }
}