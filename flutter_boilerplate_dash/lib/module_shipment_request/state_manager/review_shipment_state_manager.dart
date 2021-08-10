import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/service/shipment_request_service/first_option_service.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/review_shipment_request.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ReviewShipmentStateManger {
  final FirstOptionService _firstOptionService;
  final PublishSubject<ReviewRequestShipmentState> _stateSubject = PublishSubject();
  Stream<ReviewRequestShipmentState> get stateStream => _stateSubject.stream;

  ReviewShipmentStateManger(this._firstOptionService);

void addShipment(ShipmentRequest request){
  _stateSubject.add(LoadingState());
  _firstOptionService.addShipment(request).then((value) {
    if(value != null && value.isConfirmed){
      _stateSubject.add(SuccessfullyAddedShipment());
    }else{
      _stateSubject.add(errorState('error'));
    }
  });

}
}