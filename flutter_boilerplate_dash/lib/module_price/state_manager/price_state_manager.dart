
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container_specification/service/container_specification_service.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/service/price_service.dart';
import 'package:pasco_shipping/module_price/ui/state/price_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class PriceStateManager {
  final PriceService _priceService;
  final ContainerSpecificationService _containerSpecificationService;
  final PublishSubject<PriceState> _stateSubject = PublishSubject();
  Stream<PriceState> get stateStream => _stateSubject.stream;

  PriceStateManager(this._priceService, this._containerSpecificationService);

  void getPrice(){
    _stateSubject.add(LoadingPriceState());
    _priceService.getPrice().then((model) {
      if(model != null) {
        _containerSpecificationService.getContainerSpecification().then((specification) {
          if(specification != null){
            _stateSubject.add(FetchedPriceSuccessfullyState(model,specification));
          }
        });
      }else {
        _stateSubject.add(ErrorPriceState('connection error'));
      }
    });
  }
  void updateContainerPrice(ContainerPriceRequest request){
    _stateSubject.add(LoadingPriceState());
    _priceService.updateContainerPrice(request).then((modelUpdated) {
      if(modelUpdated != null && modelUpdated.isConfirmed) {
        print('Done');
        _priceService.getPrice().then((model) {
          if(model != null) {
            _containerSpecificationService.getContainerSpecification().then((specification) {
              if(specification != null){
                _stateSubject.add(FetchedPriceSuccessfullyState(model,specification));
              }
            });
          }else {
            _stateSubject.add(ErrorPriceState('connection error'));
          }
        });
      }else {
        _stateSubject.add(ErrorPriceState('connection error'));
      }
    });
  }
}