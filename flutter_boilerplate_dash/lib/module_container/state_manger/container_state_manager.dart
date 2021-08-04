import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container/service/container_service.dart';
import 'package:pasco_shipping/module_container/ui/state/container_state/container_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ContainerStateManager {
  final ContainerService _service;

  final PublishSubject<ContainersState> _stateSubject = PublishSubject();
  Stream<ContainersState> get stateStream => _stateSubject.stream;

  ContainerStateManager(this._service);

  // void getTravelsByTypeAndStatus(String type, String status) {
  //   _stateSubject.add(LoadingState());
  //   _service.getTravelsByTypeAndStatus(type, status).then((marks) {
  //     print(marks);
  //     if (marks != null) {
  //       _stateSubject.add(SuccessfullyFetchState(marks));
  //     } else {
  //       _stateSubject.add(ErrorState('error'));
  //     }
  //   });
  // }

  void getContainersWithFilter(ContainerFilterRequest request) {
    _stateSubject.add(LoadingState());
    _service.getContainersWithFilter(request).then((value) {
      if (value != null && value.isNotEmpty) {
        _stateSubject.add(SuccessfullyFetchState(value));
      } else if(value!.isEmpty) {
        _stateSubject.add(ErrorState('No Data' , true));
      }else if(value == null){
        _stateSubject.add(ErrorState('Error' , false));
      }
    });
  }

  void deleteContainer(String id, ContainerFilterRequest request) {
    _stateSubject.add(LoadingState());
    _service.deleteContainer(id).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _service.getContainersWithFilter(request).then((marks) {
            if (marks != null && marks.isNotEmpty) {
              _stateSubject.add(SuccessfullyFetchState(marks));
            } else if(marks!.isEmpty) {
              _stateSubject.add(ErrorState('No Data' , true));
            }else {
              _stateSubject.add(ErrorState('error' , false));
            }
          });
        }
      } else {
        _stateSubject.add(ErrorState('error' , false));
      }
    });
  }
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
