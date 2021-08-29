
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_client/service/client_service.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_filter_request.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_request.dart';
import 'package:pasco_shipping/module_receiver/service/receiver_service.dart';
import 'package:pasco_shipping/module_receiver/ui/state/receiver_state.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ReceiverStateManager{
  final ReceiverService _receiverService;
  final ClientService _clientService;
  final PublishSubject<ReceiverState> _stateSubject = PublishSubject();
  Stream<ReceiverState> get stateStream => _stateSubject.stream;

  ReceiverStateManager(this._receiverService, this._clientService);

  void getUserReceiver(ReceiverFilterRequest id , List<ClientModel> client ,Entry optionItem){
    _stateSubject.add(LoadingMarkState());
    _receiverService.getUserReceiver(id).then((marks) {
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchReceiverState(marks ,client , optionItem));
      }else {
        _stateSubject.add(ErrorMarkState('error'));
      }
    });

  }
void getClients(){
  _stateSubject.add(LoadingMarkState());
  _clientService.getClients().then((clients) {
    if(clients != null){
      _stateSubject.add(MarkFirstState(clients));
    }
  });
}


  void createMark(ReceiverRequest request ,Entry option){
    _stateSubject.add(LoadingMarkState());
    _receiverService.createReceiver(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          print("confirmed");
          ReceiverFilterRequest filterRequest = ReceiverFilterRequest(request.clientUserID);
          _receiverService.getUserReceiver(filterRequest).then((marks) {
            if(marks != null) {
              print("marks not null");
              _stateSubject.add(SuccessfullyModifyMarkState(value ,marks,option));
            }else {
              _stateSubject.add(ErrorMarkState('error'));
            }
          });
        }
        else{
          _stateSubject.add(ErrorMarkState('error'));
        }
      }else {
        _stateSubject.add(ErrorMarkState('error'));
      }
    });
  }
}