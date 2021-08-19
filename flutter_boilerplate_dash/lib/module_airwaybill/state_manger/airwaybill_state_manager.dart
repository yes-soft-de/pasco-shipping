import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_request.dart';
import 'package:pasco_shipping/module_airwaybill/service/airwaybill_service.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/airwaybill_state/airwaybill_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AirwaybillStateManager {
  final AirwaybillService _service;

  final PublishSubject<AirwaybillsState> _stateSubject = PublishSubject();
  Stream<AirwaybillsState> get stateStream => _stateSubject.stream;

  AirwaybillStateManager(this._service);

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

  void getAirwaybillsWithFilter(AirwaybillFilterRequest request) {
    _stateSubject.add(LoadingState());
    _service.getAirwaybillWithFilter(request).then((value) {
      if (value != null && value.isNotEmpty) {
        _stateSubject.add(SuccessfullyFetchState(value));
      } else if(value!.isEmpty) {
        _stateSubject.add(ErrorState('No Data' , true));
      }else if(value == null){
        _stateSubject.add(ErrorState('Error' , false));
      }
    });
  }

  void deleteContainer(String id, AirwaybillFilterRequest request) {
    _stateSubject.add(LoadingState());
    _service.deleteAirwaybill(id).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _service.getAirwaybillWithFilter(request).then((marks) {
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
