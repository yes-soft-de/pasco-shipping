import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_proxies/repository/proxies_repository.dart';
import 'package:pasco_shipping/module_proxies/request/proxies_request.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';

@injectable
class ProxyManager{
  final ProxyRepository _repository;
  ProxyManager(this._repository);

  Future<ConfirmResponse?> createProxy(ProxyRequest request) => _repository.createProxy(request);
  Future<ConfirmResponse?> deleteProxy(String id) => _repository.deleteProxy(id);
  Future<List<ProxyModel>?> getProxies() => _repository.getProxies();
  Future<ConfirmResponse?> updateProxy(ProxyRequest request) => _repository.updateProxy(request);


}