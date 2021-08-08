
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_sub_contract/request/subcontract_request.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_sub_contract/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddSubcontractStateManager{
  final SubcontractService _subcontractService;
  final SubContractServiceService _service;

  final PublishSubject<AddSubcontractState> _addStateSubject = PublishSubject();
  Stream<AddSubcontractState> get stateStream => _addStateSubject.stream;

  AddSubcontractStateManager(this._service , this._subcontractService);

  void createSubcontract(SubcontractRequest request){
    _addStateSubject.add(LoadingAddState());
    _subcontractService.createSubcontract(request).then((value) {
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


  void getAllService(){
    _addStateSubject.add(LoadingAddState());
    _service.getSubContractServices().then((value) {
      if(value != null){
        _addStateSubject.add(InitAddState(value));
      }else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
}