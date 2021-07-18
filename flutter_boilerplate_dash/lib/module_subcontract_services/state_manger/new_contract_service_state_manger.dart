
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_subcontract_services/request/sub_contract_service_request.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:pasco_shipping/module_subcontract_services/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddSubContractServiceStateManager{
  final SubContractServiceService _service;

  final PublishSubject<AddSubContractServiceState> _addStateSubject = PublishSubject();
  Stream<AddSubContractServiceState> get stateStream => _addStateSubject.stream;

  AddSubContractServiceStateManager(this._service);

  void createSubContractService(SubContractServiceRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.createSubContractService(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _addStateSubject.add(SuccessfullyAddState(value));
        }
        else{
          _addStateSubject.add(ErrorAddState('error'));
        }
      }else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
}