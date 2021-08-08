import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_client/manager/client_manager.dart';
import 'package:pasco_shipping/module_client/request/create_client_request.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';


@injectable
class ClientService {
  final ClientManager _manager;
  ClientService(this._manager);

  Future<ConfirmResponse?> createClient(CreateClientRequest request) {
    return _manager.createClient(request);
  }
  // Future<ConfirmResponse?> updateUnit(UnitRequest request) {
  //   return _manager.updateUnit(request);
  // }
  // Future<ConfirmResponse?> deleteUnit(String id) {
  //   return _manager.deleteUnit(id);
  // }
  Future<List<ClientModel>?> getClients() {
    return _manager.getClient();
  }
}