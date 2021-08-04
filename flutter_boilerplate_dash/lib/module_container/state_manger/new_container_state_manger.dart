import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/request/container_request.dart';
import 'package:pasco_shipping/module_container/service/container_service.dart';
import 'package:pasco_shipping/module_container/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_container_specification/service/container_specification_service.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddContainerStateManager {
  final ContainerService _service;
  final SubcontractService _subcontractService;
  final ContainerSpecificationService _containerSpecificationService;

  final PublishSubject<AddContainerState> _addStateSubject = PublishSubject();
  Stream<AddContainerState> get stateStream => _addStateSubject.stream;

  AddContainerStateManager(
      this._service,this._subcontractService , this._containerSpecificationService);

  void requestContainer(ContainerRequest request) {
    _addStateSubject.add(LoadingAddState());
    _service.requestContainer(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState('error'));
        }
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }

  void getSubContractAndSpecification() {
    _addStateSubject.add(LoadingAddState());
        _subcontractService.getSubcontracts().then((subs) {
          if (subs != null) {
            _containerSpecificationService.getContainerSpecification().then((value){
              if(value != null){
                _addStateSubject
                    .add(InitAddState(subcontracts: subs , specifications: value));
              } else {
                _addStateSubject.add(ErrorAddState('error'));
              }
            });
          } else {
            _addStateSubject.add(ErrorAddState('error'));
          }
        });
  }

}
