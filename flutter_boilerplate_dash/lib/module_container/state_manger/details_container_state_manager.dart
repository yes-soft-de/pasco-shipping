import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/request/add_container_to_travel_request.dart';
import 'package:pasco_shipping/module_container/request/container_change_state_request.dart';
import 'package:pasco_shipping/module_container/service/container_service.dart';
import 'package:pasco_shipping/module_container/ui/state/details_state/details_state.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/service/travel_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ContainerDetailsStateManager {
  final ContainerService _service;
  final TravelService _travelService;

  final PublishSubject<ContainerDetailsState> _addStateSubject = PublishSubject();
  Stream<ContainerDetailsState> get stateStream => _addStateSubject.stream;

  ContainerDetailsStateManager(this._service, this._travelService);

  void getContainerDetails(String id) {
    _addStateSubject.add(LoadingDetailsState());
    _service.getContainerDetails(id).then((model) {
      if (model != null) {
        _addStateSubject.add(SuccessfullyDetailsState(model));
      } else {
        _addStateSubject.add(ErrorDetailsState('error'));
      }
    });
  }

  void updateContainerStatus(ContainerChangeStateRequest request) {
    _addStateSubject.add(LoadingDetailsState());
    _service.updateContainerStatus(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _service.getContainerDetails(request.id.toString()).then((model) {
            if (model != null) {
              _addStateSubject.add(SuccessfullyDetailsWithTravelsState(model));
            }
            else {
              _addStateSubject.add(ErrorDetailsState('error'));
            }
          });
        }
        else{
          _service.getContainerDetails(request.id.toString()).then((value) {
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

  void uploadedContainerToTravel(AddContainerToTravelRequest request) {
    _addStateSubject.add(LoadingDetailsState());
    _service.uploadedContainerToTravelRequest(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _service.getContainerDetails(request.holderID.toString()).then((model) {
            if(model != null) {
              _addStateSubject.add(SuccessfullyUploadedContainerState(value ,model));
            } else {
              _addStateSubject.add(ErrorDetailsState('error'));
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
  void clearedOrArrived(AddContainerToTravelRequest request) {
    _addStateSubject.add(LoadingDetailsState());
    _service.updateContainerStatusClearedOrArrived(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _service.getContainerDetails(request.holderID.toString()).then((value) {
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

  void getContainerDetailsAndTravels(String id) {
    _addStateSubject.add(LoadingDetailsState());
    _service.getContainerDetails(id).then((model) {
      if (model != null) {
        print('InTravelDeta');
        _addStateSubject.add(SuccessfullyDetailsWithTravelsState(model));
      } else {
        _addStateSubject.add(ErrorDetailsState('error'));
      }
    });
  }
}
