
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container_specification/service/container_specification_service.dart';
import 'package:pasco_shipping/module_container_specification/ui/state/containerSpecifications_state/containerSpecification_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ContainerSpecificationStateManager{
  final ContainerSpecificationService _service;

  final PublishSubject<ContainerSpecificationsState> _stateSubject = PublishSubject();
  Stream<ContainerSpecificationsState> get stateStream => _stateSubject.stream;

  ContainerSpecificationStateManager(this._service);

  void getContainerSpecifications(){
    _stateSubject.add(LoadingState());
    _service.getContainerSpecification().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  // void deleteSupplier(String id){
  //   _stateSubject.add(LoadingState());
  //   _service.deleteSupplier(id).then((value) {
  //     if(value != null){
  //       if(value.isConfirmed){
  //         _service.getSuppliers().then((marks) {
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
  //
  // void updateSupplier(SupplierRequest request){
  //   _stateSubject.add(LoadingState());
  //   _service.updateSupplier(request).then((value) {
  //     if(value != null){
  //       if(value.isConfirmed){
  //         _service.getSuppliers().then((marks) {
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