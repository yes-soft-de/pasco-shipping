
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/service/price_service.dart';
import 'package:pasco_shipping/module_price/ui/state/price_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class PriceStateManager {
  final PriceService _profileService;
  final PublishSubject<PriceState> _stateSubject = PublishSubject();
  Stream<PriceState> get stateStream => _stateSubject.stream;

  PriceStateManager(this._profileService);

  void getPrice(){
    _stateSubject.add(LoadingPriceState());
    _profileService.getPrice().then((model) {
      if(model != null) {
        _stateSubject.add(FetchedPriceSuccessfullyState(model));
      }else {
        _stateSubject.add(ErrorPriceState('connection error'));
      }
    });
  }
  void updatePrice(PriceRequest request){
    _stateSubject.add(LoadingPriceState());
    _profileService.updatePrice(request).then((modelUpdated) {
      if(modelUpdated != null) {
        _stateSubject.add(FetchedPriceSuccessfullyState(modelUpdated));
      }else {
        _stateSubject.add(ErrorPriceState('connection error'));
      }
    });
  }
}