
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_sub_contract/request/subcontract_request.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_sub_contract/ui/state/subcontract_state/subcontract_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class SubcontractStateManager{
  final SubcontractService _service;

  final PublishSubject<SubcontractState> _stateSubject = PublishSubject();
  Stream<SubcontractState> get stateStream => _stateSubject.stream;

  SubcontractStateManager(this._service);

  void getSubcontracts(){
    _stateSubject.add(LoadingState());
    _service.getSubcontracts().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteSubcontract(String id){
    _stateSubject.add(LoadingState());
    _service.deleteSubcontract(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getSubcontracts().then((marks) {
            if(marks != null) {
              _stateSubject.add(SuccessfullyFetchState(marks));
            }else {
              _stateSubject.add(ErrorState('error'));
            }
          });
        }
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });
  }

  // void updateSubcontract(SubcontractRequest request){
  //   _stateSubject.add(LoadingState());
  //   _service.updateSubcontract(request).then((value) {
  //     if(value != null){
  //       if(value.isConfirmed){
  //         _service.getSubcontracts().then((marks) {
  //           if(marks != null) {
  //             _stateSubject.add(SuccessfullyFetchState(marks));
  //           }else {
  //             _stateSubject.add(ErrorState('error'));
  //           }
  //         });
  //       }
  //     }else {
  //       _stateSubject.add(ErrorState('error'));
  //     }
  //   });
  // }
}