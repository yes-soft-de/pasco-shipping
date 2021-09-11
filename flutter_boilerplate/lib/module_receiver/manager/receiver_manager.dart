import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_receiver/repository/receiver_repository.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_request.dart';
import 'package:pasco_shipping/module_receiver/response/receiver_response.dart';

@injectable
class ReceiverManager{
  final ReceiverRepository _repository;
  ReceiverManager(this._repository);
  Future<ConfirmResponse?> createReceiver(ReceiverRequest request) => _repository.createReceiver(request);
  Future<ConfirmResponse?> deleteReceiver(String id) => _repository.deleteReceiver(id);
  Future<List<ReceiverModel>?> getMyReceiver() => _repository.getMyReceiver();
}