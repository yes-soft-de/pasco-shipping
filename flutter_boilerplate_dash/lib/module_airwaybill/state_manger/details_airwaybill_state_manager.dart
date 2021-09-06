import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill/request/add_airwaybill_to_travel_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_change_state_request.dart';
import 'package:pasco_shipping/module_airwaybill/service/airwaybill_service.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/details_state/details_state.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/service/travel_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AirwaybillDetailsStateManager {
  final AirwaybillService _service;
  final TravelService _travelService;

  final PublishSubject<AirwaybillDetailsState> _addStateSubject = PublishSubject();
  Stream<AirwaybillDetailsState> get stateStream => _addStateSubject.stream;

  AirwaybillDetailsStateManager(this._service, this._travelService);

  void getAirwaybillDetails(String id) {
    _addStateSubject.add(LoadingDetailsState());
    _service.getAirwaybillDetails(id).then((model) {
      if (model != null) {
        _addStateSubject.add(SuccessfullyDetailsState(model));
      } else {
        _addStateSubject.add(ErrorDetailsState('error'));
      }
    });
  }

  void updateAirwaybillStatus(AirwaybillChangeStateRequest request ) {
    _addStateSubject.add(LoadingDetailsState());
    _service.updateAirwaybillStatus(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _service.getAirwaybillDetails(request.id.toString()).then((model) {
            if (model != null) {
              _addStateSubject.add(SuccessfullyDetailsWithTravelsState(model));
            }
            else {
              _addStateSubject.add(ErrorDetailsState('error'));
            }
          });
        }
        else{
          _service.getAirwaybillDetails(request.id.toString()).then((value) {
            if(value != null){
              _addStateSubject.add(SuccessfullyDetailsState(value));
            }else{
              _addStateSubject.add(ErrorDetailsState('error'));
            }
          });
        }
      }else{
        _addStateSubject.add(ErrorDetailsState('error'));
      }
    });
  }

  void uploadedAirwaybillToTravel(AddAirwaybillToTravelRequest request) {
    _addStateSubject.add(LoadingDetailsState());
    _service.uploadedAirwaybillToTravel(request).then((confirmed) {
      if (confirmed != null) {
        if (confirmed.isConfirmed) {
          _service.getAirwaybillDetails(request.holderID.toString()).then((value) {
            if(value != null) {
              _addStateSubject.add(SuccessfullyUploadedAirwaybillState(confirmed,value));
            }
          });
        }
          else {
              _addStateSubject.add(ErrorDetailsState('error'));
            }
        }else{
          _addStateSubject.add(ErrorDetailsState('error'));
        }
    });
  }
  void clearedOrArrived(AddAirwaybillToTravelRequest request) {
    _addStateSubject.add(LoadingDetailsState());
    _service.uploadedAirwaybillToTravel(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _service.getAirwaybillDetails(request.holderID.toString()).then((value) {
            if(value != null) {
              _addStateSubject.add(SuccessfullyDetailsWithTravelsState(value));
            }
          });
        }
        else {
          _addStateSubject.add(ErrorDetailsState('error'));
        }
      }else{
        _addStateSubject.add(ErrorDetailsState('error'));
      }
    });
  }

  void getAirwaybillDetailsAndTravels(String id) {
    _addStateSubject.add(LoadingDetailsState());
    _service.getAirwaybillDetails(id).then((model) {
      if (model != null) {
        _addStateSubject.add(SuccessfullyDetailsWithTravelsState(model));
      } else {
        _addStateSubject.add(ErrorDetailsState('error'));
      }
    });
  }
}
