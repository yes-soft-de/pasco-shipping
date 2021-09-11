
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_request.dart';
import 'package:pasco_shipping/module_receiver/service/receiver_service.dart';
import 'package:pasco_shipping/module_receiver/ui/state/receiver_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ReceiverStateManager{
  final ReceiverService _markService;
  final PublishSubject<ReceiverState> _stateSubject = PublishSubject();
  Stream<ReceiverState> get stateStream => _stateSubject.stream;

  ReceiverStateManager(this._markService);

  void getMyReceiver(){
    _stateSubject.add(LoadingMarkState());
    _markService.getMyReceiver().then((marks) {
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchMarkState(marks));
      }else {
        _stateSubject.add(ErrorMarkState('error'));
      }
    });

  }

  void deleteReceiver(String id){
    _stateSubject.add(LoadingMarkState());
    _markService.deleteReceiver(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _markService.getMyReceiver().then((marks) {
            if(marks != null) {
              _stateSubject.add(SuccessfullyModifyMarkState(value ,marks));
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

  void createReceiver(ReceiverRequest request){
    _stateSubject.add(LoadingMarkState());
    _markService.createReceiver(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          print("confirmed");
          _markService.getMyReceiver().then((marks) {
            if(marks != null) {
              print("marks not null");
              _stateSubject.add(SuccessfullyModifyMarkState(value ,marks));
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