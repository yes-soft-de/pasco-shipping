import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_client/repository/client_repository.dart';
import 'package:pasco_shipping/module_client/request/create_client_request.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class ClientManager{
  final ClientRepository _repository;
  ClientManager(this._repository);

  Future<ConfirmResponse?> createClient(CreateClientRequest request) => _repository.createClient(request);
  Future<ConfirmResponse?> deleteClient(String id) => _repository.deleteClient(id);
  Future<List<ClientModel>?> getClient() => _repository.getClients();
  Future<ConfirmResponse?> updateClient(CreateClientRequest request) => _repository.updateClient(request);
  Future<ConfirmResponse?> updateClientPass(UpdateClientPassRequest request) => _repository.updateClientPass(request);


}