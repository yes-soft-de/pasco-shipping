
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_subcontract_services/request/sub_contract_service_request.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:pasco_shipping/module_subcontract_services/ui/state/sub_contract_service_state/sub_contract_service_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class SubContractServiceStateManager{
  final SubContractServiceService _service;

  final PublishSubject<SubContractServiceState> _stateSubject = PublishSubject();
  Stream<SubContractServiceState> get stateStream => _stateSubject.stream;

  SubContractServiceStateManager(this._service);

  void getSubContractServices(){
    _stateSubject.add(LoadingState());
    _service.getSubContractServices().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteSubContractService(String id){
    _stateSubject.add(LoadingState());
    _service.deleteSubContractService(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getSubContractServices().then((marks) {
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

  void updateSubContractService(SubContractServiceRequest request){
    _stateSubject.add(LoadingState());
    _service.updateSubContractService(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getSubContractServices().then((marks) {
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
}