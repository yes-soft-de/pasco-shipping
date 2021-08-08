import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_proxies/manager/proxies_manager.dart';
import 'package:pasco_shipping/module_proxies/request/proxies_request.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';


@injectable
  class ProxyService {
  final ProxyManager _manager;
  ProxyService(this._manager);

  Future<ConfirmResponse?> createProxy(ProxyRequest request) {
    return _manager.createProxy(request);
  }
  Future<ConfirmResponse?> updateProxy(ProxyRequest request) {
    return _manager.updateProxy(request);
  }
  Future<ConfirmResponse?> deleteProxy(String id) {
    return _manager.deleteProxy(id);
  }
  Future<List<ProxyModel>?> getProxies() {
    return _manager.getProxies();
  }
}