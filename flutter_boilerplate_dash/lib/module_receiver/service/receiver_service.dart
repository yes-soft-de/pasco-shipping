
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_mark/manager/mark_manager.dart';
import 'package:pasco_shipping/module_mark/request/mark_request.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_receiver/manager/receiver_manager.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_filter_request.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_request.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';

@injectable
class ReceiverService {
  final ReceiverManager _manager;
  ReceiverService(this._manager);

  Future<ConfirmResponse?> createReceiver( ReceiverRequest request) {
    return _manager.createReceiver(request);
  }
  // Future<ConfirmResponse?> deleteMark(String id) {
  //   return _manager.deleteMark(id);
  // }
  Future<List<ReceiverModel>?> getUserReceiver(ReceiverFilterRequest userID) {
    return _manager.getUserReceiver(userID);
  }
}