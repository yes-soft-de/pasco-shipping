import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_receiver/repository/recevier_repository.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_filter_request.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_request.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';

@injectable
class ReceiverManager{
  final ReceiverRepository _repository;
  ReceiverManager(this._repository);

  Future<ConfirmResponse?> createReceiver(ReceiverRequest request) => _repository.createReceiver(request);
  // Future<ConfirmResponse?> deleteMark(String id) => _repository.deleteMark(id);
  Future<List<ReceiverModel>?> getUserReceiver(ReceiverFilterRequest request) => _repository.getUserReceiver(request);


}