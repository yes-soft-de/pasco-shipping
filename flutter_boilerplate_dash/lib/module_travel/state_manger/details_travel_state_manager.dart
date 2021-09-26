import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_travel/request/travel_change_state_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_request.dart';
import 'package:pasco_shipping/module_travel/service/travel_service.dart';
import 'package:pasco_shipping/module_travel/ui/state/details_state/details_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class TravelDetailsStateManager {
  final TravelService _service;

  final PublishSubject<TravelDetailsState> _addStateSubject = PublishSubject();
  Stream<TravelDetailsState> get stateStream => _addStateSubject.stream;

  TravelDetailsStateManager(this._service);

  void getTravelDetails(String id) {
    _addStateSubject.add(LoadingDetailsState());
    _service.getTravelDetails(id).then((model) {
      if (model != null) {
        _addStateSubject.add(SuccessfullyDetailsState(model));
      } else {
        _addStateSubject.add(ErrorDetailsState('error'));
      }
    });
  }

  void updateTravelStatus(
      TravelChangeStateRequest request) {
    _addStateSubject.add(LoadingDetailsState());
    _service.updateTravelStatus(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _service.getTravelDetails(request.id.toString()).then((model) {
            if (model != null) {
              _addStateSubject.add(SuccessfullyDetailsState(model));
            } else {
              _addStateSubject.add(ErrorDetailsState('error'));
            }
          });
        }else{
          _addStateSubject.add(ErrorDetailsState('error'));
        }
      }else{
        _addStateSubject.add(ErrorDetailsState('error'));
      }
    });

  }
}
