
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_receiver/manager/receiver_manager.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_request.dart';
import 'package:pasco_shipping/module_receiver/response/receiver_response.dart';

@injectable
class ReceiverService {
  final ReceiverManager _manager;
  ReceiverService(this._manager);

  Future<ConfirmResponse?> createReceiver(ReceiverRequest request) {
    return _manager.createReceiver(request);
  }
  Future<ConfirmResponse?> deleteReceiver(String id) {
    return _manager.deleteReceiver(id);
  }
  Future<List<ReceiverModel>?> getMyReceiver() {
    return _manager.getMyReceiver();
  }
}