import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipment_track/service/tracking_service.dart';
import 'package:pasco_shipping/module_shipment_track/ui/state/tarcking_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class TrackingStateManager {
  final TrackingService _trackingService;
  final PublishSubject<TrackingState> _stateSubject = PublishSubject();
  Stream<TrackingState> get stateStream => _stateSubject.stream;

  TrackingStateManager(this._trackingService);

  void getTrackDetails(String number){
    _stateSubject.add(LoadingTrackingState());
    _trackingService.getTrackDetails(number).then((model) {
      if(model != null) {
        print(model);
        _stateSubject.add(FetchedTrackingSuccessfullyState(model));
      }else {
        _stateSubject.add(ErrorTrackState('You entered the wrong number'));
      }
    });
  }
}