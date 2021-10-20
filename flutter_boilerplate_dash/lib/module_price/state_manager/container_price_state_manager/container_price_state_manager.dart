
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_price/service/container_price_service.dart';
import 'package:pasco_shipping/module_price/ui/state/container_price/container_price_state/conatiner_price_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ContainerPriceStateManager {
  final ContainerPriceService _priceService;
  // final ContainerSpecificationService _containerSpecificationService;
  final PublishSubject<ContainerPriceState> _stateSubject = PublishSubject();
  Stream<ContainerPriceState> get stateStream => _stateSubject.stream;

  ContainerPriceStateManager(this._priceService);

  void getContainerPrice(){
    _stateSubject.add(LoadingPriceState());
    _priceService.getContainerPrice().then((model) {
      if(model != null) {
        _stateSubject.add(FetchedContainerPriceSuccessfullyState(model));
      }else {
        _stateSubject.add(ErrorPriceState('connection error'));
      }
    });
  }
  // void updateContainerPrice(ContainerPriceRequest request){
  //   _stateSubject.add(LoadingPriceState());
  //   _priceService.updateContainerPrice(request).then((modelUpdated) {
  //     if(modelUpdated != null && modelUpdated.isConfirmed) {
  //       print('Done');
  //       _priceService.getPrice().then((model) {
  //         if(model != null) {
  //           _containerSpecificationService.getContainerSpecification().then((specification) {
  //             if(specification != null){
  //               _stateSubject.add(FetchedPriceSuccessfullyState(model,specification));
  //             }
  //           });
  //         }else {
  //           _stateSubject.add(ErrorPriceState('connection error'));
  //         }
  //       });
  //     }else {
  //       _stateSubject.add(ErrorPriceState('connection error'));
  //     }
  //   });
  // }
}