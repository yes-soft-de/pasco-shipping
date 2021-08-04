
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container_specification/request/container_specification_request.dart';
import 'package:pasco_shipping/module_container_specification/service/container_specification_service.dart';
import 'package:pasco_shipping/module_container_specification/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddContainerSpecificationStateManager{
  final ContainerSpecificationService _service;

  final PublishSubject<AddContainerSpecificationState> _addStateSubject = PublishSubject();
  Stream<AddContainerSpecificationState> get stateStream => _addStateSubject.stream;

  AddContainerSpecificationStateManager(this._service);

  void createContainerSpecification(ContainerSpecificationRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.createContainerSpecification(request).then((value) {
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