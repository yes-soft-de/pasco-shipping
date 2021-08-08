
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_client/service/client_service.dart';
import 'package:pasco_shipping/module_mark/request/mark_request.dart';
import 'package:pasco_shipping/module_mark/service/mark_service.dart';
import 'package:pasco_shipping/module_mark/ui/state/mark_state.dart';
import 'package:pasco_shipping/module_shipment_previous/model/drop_list_model.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class MarkStateManager{
  final MarkService _markService;
  final ClientService _clientService;
  final PublishSubject<MarkState> _stateSubject = PublishSubject();
  Stream<MarkState> get stateStream => _stateSubject.stream;

  MarkStateManager(this._markService, this._clientService);

  void getUserMarks(String id , List<ClientModel> client ,Entry optionItem){
    _stateSubject.add(LoadingMarkState());
    _markService.getUserMark(id).then((marks) {
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchMarkState(marks ,client , optionItem));
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
  void deleteMark(String markID, String userID,Entry optionItem){
    _stateSubject.add(LoadingMarkState());
    _markService.deleteMark(markID).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _markService.getUserMark(userID).then((marks) {
            if(marks != null) {
              _stateSubject.add(SuccessfullyModifyMarkState(value ,marks,optionItem));
            }else {
              _stateSubject.add(ErrorMarkState('error'));
            }
          });
        }
      }else {
        _stateSubject.add(ErrorMarkState('error'));
      }
    });
  }

  void createMark(MarkRequest request ,Entry option){
    _stateSubject.add(LoadingMarkState());
    _markService.createMark(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          print("confirmed");
          _markService.getUserMark(request.clientUserID.toString()).then((marks) {
            if(marks != null) {
              print("marks not null");
              _stateSubject.add(SuccessfullyModifyMarkState(value ,marks,option));
            }else {
              _stateSubject.add(ErrorMarkState('error'));
            }
          });
        }
        else{

        }
      }else {
        _stateSubject.add(ErrorMarkState('error'));
      }
    });
  }
}