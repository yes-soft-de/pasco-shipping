import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container_specification/service/container_specification_service.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_filter_request.dart';
import 'package:pasco_shipping/module_harbor/service/harbor_service.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/service/container_price_service.dart';
import 'package:pasco_shipping/module_price/service/price_service.dart';
import 'package:pasco_shipping/module_price/ui/state/container_price/add_container_price_state/add_container_price_state.dart';
import 'package:pasco_shipping/module_shipment_request/service/shipment_request_service/first_option_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddContainerPriceStateManager {
  final ContainerPriceService _priceService;
  final FirstOptionService _firstOptionService;
  final HarborService _harborService;
  final ContainerSpecificationService _specificationService;


  final PublishSubject<AddContainerPriceState> _addStateSubject = PublishSubject();
  Stream<AddContainerPriceState> get stateStream => _addStateSubject.stream;

  AddContainerPriceStateManager(this._priceService, this._firstOptionService, this._harborService, this._specificationService,);

  void getCountriesAndHarborAndSpecification(){
    _addStateSubject.add(LoadingAddState());
    _firstOptionService.getCountriesImport('export').then((export) {
      if(export != null){
        HarborFilterRequest harborFilterRequest =HarborFilterRequest(type: 'seaport');
        _harborService.getHarbor(harborFilterRequest).then((harbor) {
          if(harbor != null){
            _specificationService.getContainerSpecification().then((specification) {
              if(specification != null){
                _addStateSubject.add(InitAddPriceContainerState(countriesExport: export, specification: specification, harbors: harbor));
              }else{
                _addStateSubject.add(ErrorAddState('error'));
              }
            });
          }else{
            _addStateSubject.add(ErrorAddState('error'));
          }
        });
      }else{
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }

  void createContainerPrice(ContainerPriceRequest request) {
    _addStateSubject.add(LoadingAddState());
    _priceService.createContainerPrice(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState('error'));
        }
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
  void updateContainerPrice(ContainerPriceRequest request) {
    _addStateSubject.add(LoadingAddState());
    _priceService.updateContainerPrice(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState('error'));
        }
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }

}