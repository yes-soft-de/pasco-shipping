import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/service/travel_service.dart';
import 'package:pasco_shipping/module_travel/ui/state/travels_state/travel_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class TravelStateManager {
  final TravelService _service;

  final PublishSubject<TravelsState> _stateSubject = PublishSubject();
  Stream<TravelsState> get stateStream => _stateSubject.stream;

  TravelStateManager(this._service);

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

  void getTravelWithFilter(TravelFilterRequest request) {
    _stateSubject.add(LoadingState());
    _service.getTravelsWithFilter(request).then((value) {
      if (value != null && value.isNotEmpty) {
        _stateSubject.add(SuccessfullyFetchState(value));
      } else if(value!.isEmpty) {
        _stateSubject.add(ErrorState('No Data' , true));
      }else {
        _stateSubject.add(ErrorState('Error' , false));
      }
    });
  }

  void deleteTravel(String id, TravelFilterRequest request) {
    _stateSubject.add(LoadingState());
    _service.deleteTravel(id).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _service.getTravelsWithFilter(request).then((marks) {
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
